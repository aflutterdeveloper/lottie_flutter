import 'package:edispatcher/e_observable.dart';
import 'package:edispatcher/e_subscriber.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//args.animationDataV2?.file ?: args.animationData?.lottieLink
class LottiePlayer extends StatefulWidget {
  LottiePlayer(this._lottieUrl, this._bgColor, {Key key}) : super(key: key);
  final String _lottieUrl;
  final String _bgColor;

  @override
  _LottiePlayerState createState() => _LottiePlayerState();
}

class _LottiePlayerState extends State<LottiePlayer> {
  final _FrameListenerImpl _frameListener = _FrameListenerImpl();

  @override
  void dispose() {
    _frameListener.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: _colorFromHex(widget._bgColor)),
      child: Stack(
        children: <Widget>[
          Center(
              child: Lottie.network(widget._lottieUrl,
                  onLoaded: (LottieComposition composition) {
            _frameListener.attach(composition);
            composition.performanceTrackingEnabled = true;
          })),
          Column(
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              _StatusBar(_frameListener, _colorText(widget._bgColor)),
            ],
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                child: Icon(
                  Icons.close,
                  color: _colorText(widget._bgColor),
                ),
              ))
        ],
      ),
    ));
  }

  Color _colorFromHex(String hexColor) {
    if (hexColor?.isNotEmpty == true && hexColor.startsWith("#")) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }
    return Colors.white;
  }

  Color _colorText(String hexColor) {
    if (hexColor?.isNotEmpty == true && hexColor.startsWith("#")) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(0xFF000000 | (int.parse(hexCode, radix: 16) ^ 0xFFFFFF));
    }
    return Colors.black;
  }
}

class _FrameListenerImpl extends FrameListener with EObservable<_RenderEvent> {
  LottieComposition _composition;

  void attach(LottieComposition composition) {
    detach();
    _composition = composition;
    _composition.performanceTracker.addFrameListener(this);
  }

  void detach() {
    _composition?.performanceTracker?.removeFrameListener(this);
  }

  @override
  void onFrameRendered(String layer, double renderTimeMs) {
    dispatch(_RenderEvent(layer, renderTimeMs));
  }

  void destroy() {
    detach();
    close();
  }
}

class _RenderEvent {
  final String layer;
  final double time;

  _RenderEvent(this.layer, this.time);
}

class _StatusBar extends StatefulWidget {
  final EObservable _renderEvent;
  final Color _color;

  _StatusBar(this._renderEvent, this._color);

  @override
  State<StatefulWidget> createState() {
    return _StatusBarState();
  }
}

class _StatusBarState extends State<_StatusBar> with ESubscriber {
  List<_RenderEvent> _eventHistory = List<_RenderEvent>();
  bool _expand = false;

  @override
  void initState() {
    widget._renderEvent.onType<_RenderEvent>(this, (event) {
      setState(() {
        _eventHistory.add(event);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_eventHistory.isEmpty) {
      return Container();
    }

    final statusBar = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _expand = !_expand;
          });
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
          child: Row(children: <Widget>[
            Text(
              "当前帧耗时: ${_eventHistory.last.time} ms",
              style: TextStyle(color: widget._color, fontSize: 14),
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              !_expand ? Icons.expand_less : Icons.expand_more,
              color: widget._color,
            ),
            SizedBox(
              width: 10,
            )
          ]),
        ));

    if (_expand) {
      return Column(
        children: <Widget>[
          Container(
            height: 300,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemExtent: 20,
                itemCount: _eventHistory.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 20,
                      padding: EdgeInsets.only(top: 2),
                      child: Row(children: <Widget>[
                        Text(
                          "$index帧耗时: ${_eventHistory[index].time} ms",
                          style: TextStyle(color: widget._color, fontSize: 14),
                        ),
                      ]));
                }),
          ),
          statusBar,
        ],
      );
    } else {
      return statusBar;
    }
  }
}
