import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/tactivity_controller.dart';
import '../../../core/base/component/app_bar/heading_minto.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../service/model/common/activity/t_activity_model.dart';
import '../../participant/activity/activity_boxes.dart';
import 'new_activity_screen.dart';
import 'tactivity_list_page.dart';
import 'tmy_activity_list_page.dart';
import 'tmy_up_coming_list_page.dart';

class TherapistActivityScreen extends StatelessWidget {
  const TherapistActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TherapistActivityController>(
      getController: TherapistActivityController(),
      onModelReady: (controller) {
        controller.setContext(context);
      },
      onPageBuilder:
          (BuildContext context, TherapistActivityController controller) =>
              Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                rowView(
                    UiBaseModel.appBarModel(
                        ActivityTextUtil.activity,
                        IconButton(
                            onPressed: () {
                              controller.updatechnage(1);
                              context.push(const NewActivityScreen());
                            },
                            icon: IconUtility.addIcon)),
                    AppPaddings.mediumxPadding),
                HeadingMinto(
                  text: ActivityTextUtil.myupcomingActivities,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TMyUpComingActivitiesListPage());
                  },
                ),
                Obx(
                  () => myUpcomingActivities(
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
                    context.push(const TActivityListPage());
                  },
                ),
                otherUpcomingActivities(),
                HeadingMinto(
                  text: ActivityTextUtil.myActivty,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {
                    context.push(const TMyActivityListPage());
                  },
                ),
                myPastActivities(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ActivityBox otherPastActivities() {
    return ActivityBox(
        onButtonTap: () {},
        istwobutton: false,
        buttonText: ActivityTextUtil.join,
        containerModel: AppContainers.containerButton(true),
        isactivity: false,
        arowModel: DemoInformation.arowmodel,
        //  ayrowwModel: DemoInformation.ayrowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox myPastActivities(
      BuildContext context, TherapistActivityController controller) {
    return ActivityBox(
        onButtonTap: () {
          controller.updatechnage(0);
        },
        istwobutton: false,
        buttonText: ActivityTextUtil.watchTheRecording,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.arowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  Widget otherUpcomingActivities() => activitythreerowbox(
      () {},
      () {},
      DemoInformation.arowmodel,
      DemoInformation.clockmodel,
      ActivityTextUtil.join,
      DemoInformation.ayrowmodel);

  ActivityBox myUpcomingActivities(
      BuildContext context,
      TherapistActivityController therapistActivityController,
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
