import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';
import 'package:terapievim/service/model/therapist/activity/t_activity_model.dart';

import '../../../controller/tactivity_controller.dart';
import '../../../core/base/component/group/group_box.dart';

class TherapistActivityScreen extends StatefulWidget {
  const TherapistActivityScreen({super.key});

  @override
  State<TherapistActivityScreen> createState() =>
      _TherapistActivityScreenState();
}

class _TherapistActivityScreenState extends State<TherapistActivityScreen> {
  final TherapistActivtyController therapistActivtyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            therapistActivtyController.updatechnage(1);
                            context.push(const NewActivityScreen());
                          },
                          icon: IconUtility.addIcon)),
                  AppPaddings.mediumxPadding),
              activityminto(ActivityTextUtil.myupcomingActivities, () {},
                  MainAxisAlignment.spaceBetween, true, IconUtility.forward),
              Obx(
                () => myupcomingactivities(
                    context,
                    therapistActivtyController,
                    therapistActivtyController.recentActivities.isEmpty
                        ? null
                        : therapistActivtyController.recentActivities[0]),
              ),
              activityminto(ActivityTextUtil.activity, () {},
                  MainAxisAlignment.spaceBetween, true, IconUtility.forward),
              otherupcomingactivites(),
              activityminto(ActivityTextUtil.myActivty, () {},
                  MainAxisAlignment.spaceBetween, true, IconUtility.forward),
              mypastactivites(),
              /*
              activityminto(ActivityTextUtil.otherPastActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              otherpastactivites(),*/
            ],
          ),
        ),
      ),
    );
  }

  ActivityBox otherpastactivites() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.join,
        containerModel: AppContainers.containerButton(true),
        isactivity: false,
        arowModel: DemoInformation.arowmodel,
        ayrowwModel: DemoInformation.ayrowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox mypastactivites() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.watchTheRecording,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.arowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox otherupcomingactivites() {
    return ActivityBox(
        istwobutton: false,
        buttonText: ActivityTextUtil.join,
        containerModel: AppContainers.containerButton(false),
        isactivity: false,
        arowModel: DemoInformation.arowmodel,
        ayrowwModel: DemoInformation.ayrowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  ActivityBox myupcomingactivities(
      BuildContext context,
      TherapistActivtyController therapistActivtyController,
      TActivityModel? recentActivity) {
    return ActivityBox(
        istwobutton: true,
        buttonText: ActivityTextUtil.start,
        containerModel: AppContainers.containerButton(false),
        isactivity: true,
        onTap: () {
          therapistActivtyController.createMeeting(
              context: context, activity: recentActivity);
        },
        arowModel: DemoInformation.recentActivityTitle(
            recentActivity?.title ?? 'Empty'),
        clockModel: DemoInformation.recentActivityTime(
            recentActivity?.dateTime ?? Timestamp.now()));
  }

/*Row activityappbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, top: 10),
          child: search(UiBaseModel.searchModel(
            ActivityTextUtil.searchText,
            IconButton(
              onPressed: () {
                context.push(const FilterScreen());

                //trendyolfiltreicondüzenleme
              },
              icon: IconUtility.fiterIcon,
            ),
          )),
        ),
        IconButton(
            onPressed: () {
              therapistActivtyController.updatechnage(1);

              context.push(const NewActivityScreen());
            },
            icon: IconUtility.addIcon)
      ],
    );
  }
}*/
}
