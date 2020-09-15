import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIndicator extends StatefulWidget {
  /// Creates an iOS-style activity indicator that spins clockwise.
  const CircleIndicator({
    Key key,
    this.animating = true,
    this.radius = 10.0,
    this.tickColor = Colors.grey
  }) : assert(animating != null),
        assert(radius != null),
        assert(radius > 0),
        super(key: key);

  /// Whether the activity indicator is running its animation.
  ///
  /// Defaults to true.
  final bool animating;

  /// Radius of the spinner widget.
  ///
  /// Defaults to 10px. Must be positive and cannot be null.
  final double radius;
  
  final Color tickColor;

  @override
  _CircleIndicatorState createState() => _CircleIndicatorState();
}


class _CircleIndicatorState extends State<CircleIndicator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    if (widget.animating)
      _controller.repeat();
  }

  @override
  void didUpdateWidget(CircleIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animating != oldWidget.animating) {
      if (widget.animating)
        _controller.repeat();
      else
        _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radius * 2,
      width: widget.radius * 2,
      child: CustomPaint(
        painter: _CircleIndicatorPainter(
          position: _controller,
          activeColor: widget.tickColor,
          radius: widget.radius,
        ),
      ),
    );
  }
}

const double _kTwoPI = math.pi * 2.0;
const int _kTickCount = 12;

// Alpha values extracted from the native component (for both dark and light mode).
// The list has a length of 12.
const List<int> _alphaValues = <int>[147, 131, 114, 97, 81, 64, 47, 47, 47, 47, 47, 47];

class _CircleIndicatorPainter extends CustomPainter {
  _CircleIndicatorPainter({
    @required this.position,
    @required this.activeColor,
    double radius,
  }) : tickFundamentalRRect = RRect.fromLTRBXY(
    -radius,
    radius / 10.0,
    -radius / 2.0,
    -radius / 10.0,
    radius / 10.0,
    radius / 10.0,
  ),
        super(repaint: position);

  final Animation<double> position;
  final RRect tickFundamentalRRect;
  final Color activeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    canvas.save();
    canvas.translate(size.width / 2.0, size.height / 2.0);

    final int activeTick = (_kTickCount * position.value).floor();

    for (int i = 0; i < _kTickCount; ++ i) {
      final int t = (i + activeTick) % _kTickCount;
      paint.color = activeColor.withAlpha(_alphaValues[t]);
      canvas.drawRRect(tickFundamentalRRect, paint);
      canvas.rotate(-_kTwoPI / _kTickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_CircleIndicatorPainter oldPainter) {
    return oldPainter.position != position || oldPainter.activeColor != activeColor;
  }
}
