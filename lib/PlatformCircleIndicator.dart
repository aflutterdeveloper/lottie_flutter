import 'dart:io';

import 'package:flutter/material.dart';

import 'CircleIndicator.dart';

class PlatformCircleIndicator extends StatelessWidget {
  PlatformCircleIndicator(this._background, this._valueColor,
      {this.width = 40, this.height = 40, this.strokeWith = 4.0});

  final Color _background;
  final Color _valueColor;
  final double width;
  final double height;
  final double strokeWith;

  @override
  Widget build(BuildContext context) {
    return _indicatorWidget();
  }

  Widget _indicatorWidget() {
    if (Platform.isAndroid) {
      return Container(
          width: width,
          height: height,
          child: CircularProgressIndicator(
              strokeWidth: strokeWith,
              backgroundColor: _background,
              valueColor: AlwaysStoppedAnimation<Color>(_valueColor)));
    } else {
      return CircleIndicator(
        radius: width / 2,
        tickColor: _valueColor,
      );
    }
  }
}
