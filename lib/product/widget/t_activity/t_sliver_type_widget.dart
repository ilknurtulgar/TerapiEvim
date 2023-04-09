import 'package:flutter/material.dart';

import '../../../core/base/component/app_bar/heading_minto.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';

class SliverType extends StatelessWidget {
  const SliverType({
    super.key,
    required this.activityType,
    required this.arrowOnTap,
    required this.sLiverListWidget,
    required this.childCount,
  });
  final Function() arrowOnTap;
  final ActivityType activityType;
  final Widget sLiverListWidget;
  final int childCount;
  @override
  Widget build(BuildContext context) {
    late String activityTypeText = headingSet(activityType);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeadingMinto(
              text: activityTypeText,
              onPressed: arrowOnTap,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              isButterfly: true,
              icon: IconUtility.filterIcon),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return sLiverListWidget;
          }, childCount: childCount),
        ),
      ],
    );
  }
}

enum ActivityType { myactivity, activity, upcomingActivities, pastactivities }

String headingSet(ActivityType type) {
  switch (type) {
    case ActivityType.activity:
      return ActivityTextUtil.activity;
    case ActivityType.myactivity:
      return ActivityTextUtil.myActivty;
    case ActivityType.upcomingActivities:
      return ActivityTextUtil.upcomingActivities;
    case ActivityType.pastactivities:
      return ActivityTextUtil.pastActivities;
  }
}
