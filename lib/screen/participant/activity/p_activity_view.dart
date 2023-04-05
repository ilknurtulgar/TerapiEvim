import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/participant/activity/p_activity_controller.dart';
import '../../../core/base/component/app_bar/heading_minto.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import '../../common/activity/about_activity.dart';

class PActivityView extends StatelessWidget {
  const PActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PActivityController>(
        getController: PActivityController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
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
                    activityLoadSeminar(controller),
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
          );
        });
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
          context.push(const AboutActivityView());
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
        context.push(const AboutActivityView());
      }, () {}, DemoInformation.arowmodel, DemoInformation.clockmodel,
          ActivityTextUtil.watchTheRecording, DemoInformation.ayrowmodel);
    },
    itemCount: 2,
  );
}
