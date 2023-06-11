import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/product/widget/common/empty_sized_box_text.dart';

import '../../../controller/participant/activity/p_upcoming_activities_list_view_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';

class PUpComingActivitiesListView extends StatelessWidget {
  const PUpComingActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PUpComingActivitiesListViewController>(
      getController: PUpComingActivitiesListViewController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.upcomingActivities),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Obx(() => controller.upComingActivities.isEmpty
              ? EmptySizedBoxText()
              : upcomingActivitiesListView(controller)),
        ),
      ),
    );
  }

  ListView upcomingActivitiesListView(
      PUpComingActivitiesListViewController controller) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TActivityModel? activityModel =
            controller.upComingActivities[index];
        return activityThreeRowBox(() {
          controller.joinActivity(context, activityModel!);
        },
            () {},
            DemoInformation.titlenameActivityMod(
                activityModel?.title ?? "empty title"),
            DemoInformation.clockRow(
                activityModel?.dateTime ?? Timestamp.now()),
            ActivityTextUtil.join,
            DemoInformation.therapistnameActivityMod(
                activityModel?.therapistName ?? "empty therapist name"));
      },
      itemCount: controller.upComingActivities.length,
    );
  }
}
