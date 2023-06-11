import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/product/widget/common/empty_sized_box_text.dart';
import 'package:terapievim/screen/therapist/activity/t_my_activity_list_view.dart';
import 'package:terapievim/screen/therapist/activity/t_new_activity_view.dart';
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
                  context.push(TNewActivityView());
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
                  isIcon: true,
                  text: ActivityTextUtil.myupcomingActivities,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TMyUpComingActivitiesListView());
                  },
                ),
                Obx(
                  () => controller.myRecentActivities.isEmpty
                      ? EmptySizedBoxText()
                      : _myUpcomingActivities(
                          context,
                          controller,
                          controller.myRecentActivities.isEmpty
                              ? null
                              : controller.myRecentActivities[0]),
                ),
                HeadingMinto(
                  isIcon: true,
                  text: ActivityTextUtil.activity,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TActivityListView());
                  },
                ),
                Obx(
                  () => controller.otherActivitieslist.isEmpty
                      ? EmptySizedBoxText()
                      : _otherUpcomingActivities(
                          controller.otherActivitieslist.isEmpty
                              ? null
                              : controller.otherActivitieslist.last),
                ),
                HeadingMinto(
                  isIcon: true,
                  text: ActivityTextUtil.myActivty,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TMyActivityListView());
                  },
                ),
                Obx(
                  () => controller.myPastActivitieslist.isEmpty
                      ? EmptySizedBoxText()
                      : _myPastActivities(
                          context,
                          controller,
                          controller.myPastActivitieslist.isEmpty
                              ? null
                              : controller.myPastActivitieslist.last),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ActivityBox _myPastActivities(BuildContext context,
      TActivityController controller, TActivityModel? myPastActivity) {
    return ActivityBox(
        rightButtonTap: () {
          flutterErrorToast(EmptyTextUtil.emptyText);
        },
        istwobutton: false,
        buttonText: ActivityTextUtil.watchTheRecording,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.myPastActivities(
            myPastActivity?.title ?? "Nefes Egzersizleri"),
        clockModel: DemoInformation.myPastActivitiesTime(
            myPastActivity?.dateTime ?? Timestamp.now()));
  }

  Widget _otherUpcomingActivities(TActivityModel? otherUpComingActivity) =>
      activityThreeRowBox(
          () {},
          () {},
          DemoInformation.myPastActivities(
              otherUpComingActivity?.title ?? "empty title"),
          DemoInformation.myPastActivitiesTime(
              otherUpComingActivity?.dateTime ?? Timestamp.now()),
          ActivityTextUtil.join,
          DemoInformation.therapistnameActivityMod(
              otherUpComingActivity?.therapistName ?? "empty   name"));

  ActivityBox _myUpcomingActivities(
      BuildContext context,
      TActivityController therapistActivityController,
      TActivityModel? recentActivity) {
    return ActivityBox(
        istwobutton: true,
        buttonText: ActivityTextUtil.start,
        containerModel: AppContainers.containerButton(false),
        isactivity: true,
        rightButtonTap: () {
          therapistActivityController.createMeeting(
            context: context,
            activity: recentActivity,
            isMainTherapist: true,
          );
        },
        leftButtonTapped: () {
          print("here");

          context.push(TUpdateActivityView(
            activity: recentActivity!,
          ));
        },
        arowModel: DemoInformation.recentActivityTitle(
            recentActivity?.title ?? 'Nefes Egzersizleri'),
        clockModel: DemoInformation.recentActivityTime(
            recentActivity?.dateTime ?? Timestamp.now()));
  }
}
