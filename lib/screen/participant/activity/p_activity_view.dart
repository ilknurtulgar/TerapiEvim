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
                  Obx(
                    () => _activityRecentSeminar(
                        controller,
                        context,
                        controller.recentActivities.isEmpty
                            ? null
                            : controller.recentActivities.first),
                  ),
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
                  Obx(() => _activityPastSeminar(
                      context,
                      controller.pastActivities.isEmpty
                          ? null
                          : controller.pastActivities.last))
                ],
              ),
            ),
          );
        });
  }
}

Widget _activityRecentSeminar(PActivityController pActivityController,
    BuildContext context, TActivityModel? recentactivity) {
  return SliverToBoxAdapter(
    child: activitythreerowbox(
      () {
        context.push(const AboutActivityView());
      },
      () {
        pActivityController.joinActivity(context, recentactivity!);
      },
      DemoInformation.titlenameActivityMod(
          recentactivity?.title ?? 'empty title'),
      DemoInformation.recentActivityTime(
          recentactivity?.dateTime ?? Timestamp.now()),
      ActivityTextUtil.join,
      DemoInformation.therapistnameActivityMod(
          recentactivity?.therapistName ?? "empty therapist name"),
    ),
  );
}

Widget _activityPastSeminar(
    BuildContext context, TActivityModel? pastactivity) {
  return SliverToBoxAdapter(
    child: activitythreerowbox(() {
      context.push(const AboutActivityView());
    },
        () {},
        DemoInformation.myPastActivities(pastactivity?.title ?? "empty title"),
        DemoInformation.myPastActivitiesTime(
            pastactivity?.dateTime ?? Timestamp.now()),
        ActivityTextUtil.watchTheRecording,
        DemoInformation.therapistnameActivityMod(
            pastactivity?.therapistName ?? "empty therapist name")),
  );
}
