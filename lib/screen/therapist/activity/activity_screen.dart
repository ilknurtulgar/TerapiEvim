import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

import '../../../controller/tactivity_controller.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../participant/activity/a_filter.dart';

class TherapistActivityScreen extends StatefulWidget {
  const TherapistActivityScreen({super.key});

  @override
  State<TherapistActivityScreen> createState() =>
      _TherapistActivityScreenState();
}

class _TherapistActivityScreenState extends State<TherapistActivityScreen> {
  TherapistActivtyController therapistActivtyController =
      Get.put(TherapistActivtyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              activityappbar(context),
              activityminto(ActivityTextUtil.myupcomingActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              myupcomingactivities(),
              activityminto(ActivityTextUtil.otherUpComingActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              otherupcomingactivites(),
              activityminto(ActivityTextUtil.myPastActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              mypastactivites(),
              activityminto(ActivityTextUtil.otherPastActivities, () {},
                  MainAxisAlignment.spaceAround, true, IconUtility.forward),
              otherpastactivites(),
              sizedbox()
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
        containerModel: AppContainers.containerButton(false),
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

  ActivityBox myupcomingactivities() {
    return ActivityBox(
        istwobutton: true,
        buttonText: ActivityTextUtil.start,
        containerModel: AppContainers.containerButton(true),
        isactivity: true,
        arowModel: DemoInformation.arowmodel,
        clockModel: DemoInformation.clockmodel);
  }

  Row activityappbar(BuildContext context) {
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
}
