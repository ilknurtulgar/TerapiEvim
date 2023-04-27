import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';
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
                      isIcon: true,
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
                    () => controller.recentActivities.isEmpty
                        ? SliverToBoxAdapter(child: EmptySizedBoxText())
                        : _activityRecentSeminar(
                            controller,
                            context,
                            controller.recentActivities.isEmpty
                                ? null
                                : controller.recentActivities.first),
                  ),
                  SliverToBoxAdapter(
                    child: HeadingMinto(
                      isIcon: true,
                      text: ActivityTextUtil.pastActivities,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      isButterfly: true,
                      icon: IconUtility.forward,
                      onPressed: () {
                        context.push(PPastActivitiesListView());
                      },
                    ),
                  ),
                  Obx(() => controller.pastActivities.isEmpty
                      ? SliverToBoxAdapter(child: EmptySizedBoxText())
                      : _activityPastSeminar(
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
        pActivityController.joinActivity(context, recentactivity!);
      },
      () {
        context.push(const AboutActivityView(
          isService: false,
        ));
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
      flutterErrorToast("Aktivite kaydı bulunmamaktadır");
    }, () {
      context.push(const AboutActivityView(
        isService: false,
      ));
    },
        DemoInformation.myPastActivities(pastactivity?.title ?? "empty title"),
        DemoInformation.myPastActivitiesTime(
            pastactivity?.dateTime ?? Timestamp.now()),
        ActivityTextUtil.watchTheRecording,
        DemoInformation.therapistnameActivityMod(
            pastactivity?.therapistName ?? "empty therapist name")),
  );
}
