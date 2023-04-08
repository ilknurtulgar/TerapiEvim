import 'package:flutter/material.dart';

import '../../../core/base/component/app_bar/heading_minto.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../common/activity/activity_boxes.dart';

class SliverType extends StatelessWidget {
  const SliverType({
    super.key,
    required this.activityType,
  });

  final ActivityType activityType;

  @override
  Widget build(BuildContext context) {
    late String activityTypeText = headingSet(activityType);
    late Function() activityOntap = onTapActivities(activityType);
    late Widget activitylist = activitySliver(activityType);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HeadingMinto(
              text: activityTypeText,
              onPressed: activityOntap,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              isButterfly: true,
              icon: IconUtility.filterIcon),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return activitylist;
          }, childCount: 5),
        ),
      ],
    );
  }
}

enum ActivityType { myactivity, activity }

String headingSet(ActivityType type) {
  switch (type) {
    case ActivityType.activity:
      return ActivityTextUtil.activity;
    case ActivityType.myactivity:
      return ActivityTextUtil.myActivty;
  }
}

Function() onTapActivities(ActivityType type) {
  switch (type) {
    case ActivityType.activity:
      return () {};
    case ActivityType.myactivity:
      return () {};
  }
}

Widget activitySliver(ActivityType type) {
  switch (type) {
    case ActivityType.activity:
      return activitythreerowbox(
          () {},
          () {},
          DemoInformation.arowmodel,
          DemoInformation.clockmodel,
          ActivityTextUtil.join,
          DemoInformation.ayrowmodel);

    case ActivityType.myactivity:
      return ActivityBox(
          onButtonTap: () {},
          istwobutton: false,
          buttonText: ActivityTextUtil.watchTheRecording,
          containerModel: AppContainers.containerButton(true),
          isactivity: true,
          arowModel: DemoInformation.arowmodel,
          clockModel: DemoInformation.clockmodel);
  }
}
