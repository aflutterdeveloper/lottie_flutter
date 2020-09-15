import 'dart:math' show min;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PullListView extends CustomScrollView {
  PullListView.builder(
      {@required IndexedWidgetBuilder itemBuilder,
      WidgetBuilder indicatorBuilder,
      int itemCount,
      double itemExtent,
      ScrollController controller,
      Future<void> Function() onRefresh})
      : super(
            controller: controller,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverFixedExtentList(
                itemExtent: itemExtent,
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return itemBuilder(context, index);
                  },
                  childCount: itemCount,
                ),
              ),
              CupertinoSliverRefreshControl(
                refreshTriggerPullDistance: 60,
                builder: (
                    BuildContext context,
                    RefreshIndicatorMode refreshState,
                    double pulledExtent,
                    double refreshTriggerPullDistance,
                    double refreshIndicatorExtent,
                    ) {
                  const Curve opacityCurve =
                  Interval(0.4, 0.8, curve: Curves.easeInOut);
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Opacity(
                        opacity: opacityCurve.transform(
                            min(pulledExtent / refreshIndicatorExtent, 1.0)),
                        child: indicatorBuilder == null
                            ? CupertinoActivityIndicator(radius: 14.0)
                            : indicatorBuilder(context),
                      ),
                    ),
                  );
                },
                onRefresh: onRefresh,
              ),
            ]);
}
