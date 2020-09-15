import 'package:autility/autility.dart';
import 'package:autility/utility/a_log.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottieflutter/PlatformCircleIndicator.dart';
import 'package:lottieflutter/lottie_player.dart';
import 'package:lottieflutter/model/AnimationResponse.dart';
import 'package:lottieflutter/model/LottieModel.dart';

class RecentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecentPageState();
  }
}

class RecentPageState extends State<RecentPage> {
  final LottieModel _model = LottieModel<AnimationData>(
      "v1/recent", AnimationResponseSerialize(),
      pageCount: 1999);

  @override
  void initState() {
    _model.loadNextPage().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (Notification notification) {
        if (notification is ScrollEndNotification) {
          _model.loadNextPage().then((value) {
            setState(() {});
          });
        }
        return true;
      },
      child: ListView.builder(
        itemCount: _model.count + 1,
        itemExtent: 120,
        itemBuilder: (context, index) {
          if (index == _model.count) {
            return Container(
              height: 120,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 80,
                    height: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white),
                    child: Center(
                      child: PlatformCircleIndicator(
                        Colors.transparent,
                        Colors.blue,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "loading",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xFF242424),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            );
          }
          AnimationData data = _model.getData(index);
          ALog.info("index", " $index");
          return InkWell(
            onTap: (){
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => LottiePlayer(data.lottieLink, data.bgColor)));
            },
              child: Container(
            height: 120,
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: data.preview,
                      width: 80,
                      height: 110,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xFF242424),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Author: ${data.userInfo?.name ?? "unknow"}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(flex: 1),
                      Row(
                        children: <Widget>[
                          Text(
                            "view:",
                            style: _greStyle(),
                          ),
                          Text(
                            data.views.toString(),
                            style: _greStyle(),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "download:",
                            style: _greStyle(),
                          ),
                          Text(
                            data.views.toString(),
                            style: _greStyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  TextStyle _greStyle() {
    return TextStyle(color: Color(0xFF949494), fontSize: 14);
  }
}
