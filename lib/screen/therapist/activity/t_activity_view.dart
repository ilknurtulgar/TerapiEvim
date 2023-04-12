import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/therapist/activity/t_update_activity_view.dart';

import '../../../controller/therapist/activity/t_activity_controller.dart';
import '../../../core/base/component/app_bar/heading_minto.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import 't_activity_list_view.dart';
import 't_my_up_coming_list_view.dart';

class TActivityView extends StatelessWidget {
  TActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TActivityController>(
      getController: TActivityController(),
      onModelReady: (controller) {
        controller.setContext(context);
      },
      onPageBuilder: (BuildContext context, TActivityController controller) =>
          Scaffold(
        appBar: MyAppBar(
          title: ActivityTextUtil.activity,
          actions: [
            IconButton(
                onPressed: () {
                  context.push(const TUpdateActivityView());
                },
                icon: IconUtility.addcircleIcon),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                HeadingMinto(
                  text: ActivityTextUtil.myupcomingActivities,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TMyUpComingActivitiesListView());
                  },
                ),
                Obx(
                  () => _myUpcomingActivities(
                      context,
                      controller,
                      controller.myRecentActivities.isEmpty
                          ? null
                          : controller.myRecentActivities[0]),
                ),
                HeadingMinto(
                  text: ActivityTextUtil.activity,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TActivityListView());
                  },
                ),
                _otherUpcomingActivities(),
                HeadingMinto(
                  text: ActivityTextUtil.myActivty,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TActivityListView());
                  },
                ),
                _myPastActivities(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ActivityBox _myPastActivities(
      BuildContext context, TActivityController controller) {
    return ActivityBox(
        onButtonTap: () {},
        istwobutton: false,
        buttonText: ActivityTextUtil.watchTheRecording,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.arowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  Widget _otherUpcomingActivities() => activitythreerowbox(
      () {},
      () {},
      DemoInformation.arowmodel,
      DemoInformation.clockmodel,
      ActivityTextUtil.join,
      DemoInformation.ayrowmodel);

  ActivityBox _myUpcomingActivities(
      BuildContext context,
      TActivityController therapistActivityController,
      TActivityModel? recentActivity) {
    return ActivityBox(
        istwobutton: true,
        buttonText: ActivityTextUtil.start,
        containerModel: AppContainers.containerButton(false),
        isactivity: true,
        onButtonTap: () {
          therapistActivityController.createMeeting(
              context: context, activity: recentActivity);
        },
        arowModel: DemoInformation.recentActivityTitle(
            recentActivity?.title ?? 'Empty'),
        clockModel: DemoInformation.recentActivityTime(
            recentActivity?.dateTime ?? Timestamp.now()));
  }
}
