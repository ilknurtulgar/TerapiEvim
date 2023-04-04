import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/app_bar/heading_minto.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';

import '../../../controller/participant/p_activity_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../../service/model/common/activity/t_activity_model.dart';
import 'about_activity.dart';
import 'activity_boxes.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  late final PActivityController _pActivityController;

  @override
  void initState() {
    _pActivityController = Get.put(PActivityController());
    super.initState();
  }

  @override
  void dispose() {
    _pActivityController.dispose();
    Get.delete<PActivityController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.activity),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                HeadingMinto(
                  text: ActivityTextUtil.upcomingActivities,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {},
                ),
                activityLoadSeminar(_pActivityController),
                HeadingMinto(
                  text: ActivityTextUtil.pastActivities,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  isButterfly: true,
                  icon: IconUtility.forward,
                  onPressed: () {},
                ),
                activityPastSeminar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget activityLoadSeminar(PActivityController pActivityController) {
  return Obx(
    () => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pActivityController.recentActivities.length,
      itemBuilder: (context, index) {
        final TActivityModel activity =
            pActivityController.recentActivities[index]!;
        return activitythreerowbox(() {
          context.push(const AboutActivityScreen());
        }, () {
          pActivityController.joinActivity(context, activity);
        },
            DemoInformation.recentActivity(activity.therapistName ?? ''),
            DemoInformation.recentActivityTime(
                activity.dateTime ?? Timestamp.now()),
            ActivityTextUtil.join,
            DemoInformation.ayrowmodel);
      },
    ),
  );
}

ListView activityPastSeminar() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return activitythreerowbox(() {
        context.push(const AboutActivityScreen());
      }, () {}, DemoInformation.arowmodel, DemoInformation.clockmodel,
          ActivityTextUtil.watchTheRecording, DemoInformation.ayrowmodel);
    },
    itemCount: 2,
  );
}
