import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/tactivity_controller.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../service/model/common/activity/t_activity_model.dart';
import '../../participant/activity/activities.dart';
import 'new_activity_screen.dart';

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
                              therapistActivityController.updatechnage(1);
                              context.push(const NewActivityScreen());
                            },
                            icon: IconUtility.addIcon)),
                    AppPaddings.mediumxPadding),
                activityminto(ActivityTextUtil.myupcomingActivities, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                Obx(
                  () => myUpcomingActivities(
                      context,
                      therapistActivityController,
                      therapistActivityController.recentActivities.isEmpty
                          ? null
                          : therapistActivityController.recentActivities[0]),
                ),
                activityminto(ActivityTextUtil.activity, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                otherUpcomingActivities(),
                activityminto(ActivityTextUtil.myActivty, () {},
                    MainAxisAlignment.spaceBetween, true, IconUtility.forward),
                myPastActivities(),
                /*
              activityminto(ActivityTextUtil.otherPastActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              otherpastactivites(),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  ActivityBox otherPastActivities() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.join,
        containerModel: AppContainers.containerButton(true),
        isactivity: false,
        arowModel: DemoInformation.arowmodel,
        ayrowwModel: DemoInformation.ayrowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox myPastActivities() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.watchTheRecording,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.arowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox otherUpcomingActivities() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.join,
        containerModel: AppContainers.containerButton(false),
        isactivity: false,
        arowModel: DemoInformation.arowmodel,
        ayrowwModel: DemoInformation.ayrowmodel,
        clockModel: DemoInformation.clockmodel);
  }

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