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
import 'p_past_activities_list_view.dart';
import 'p_upcoming_activities_list_view.dart';

class PActivityView extends StatelessWidget {
  const PActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PActivityController>(
        getController: PActivityController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(title: ActivityTextUtil.activity),
            body: Padding(
              padding: AppPaddings.pagePadding,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: HeadingMinto(
                      text: ActivityTextUtil.upcomingActivities,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      isButterfly: true,
                      icon: IconUtility.forward,
                      onPressed: () {
                        context.push(PUpComingActivitiesListView());
                      },
                    ),
                  ),
                  activityLoadSeminar(controller),
                  SliverToBoxAdapter(
                    child: HeadingMinto(
                      text: ActivityTextUtil.pastActivities,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      isButterfly: true,
                      icon: IconUtility.forward,
                      onPressed: () {
                        context.push(PPastActivitiesListView());
                      },
                    ),
                  ),
                  activityPastSeminar()
                ],
              ),
            ),
          );
        });
  }
}

Widget activityLoadSeminar(PActivityController pActivityController) {
  return Obx(() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
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
          childCount: pActivityController.recentActivities.length,
        ),
      ));
}

SliverList activityPastSeminar() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return activitythreerowbox(() {
          context.push(const AboutActivityView());
        }, () {}, DemoInformation.arowmodel, DemoInformation.clockmodel,
            ActivityTextUtil.watchTheRecording, DemoInformation.ayrowmodel);
      },
      childCount: 2,
    ),
  );
}
