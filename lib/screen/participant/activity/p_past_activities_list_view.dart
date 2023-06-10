import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/participant/activity/p_past_activities_list_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import '../../../product/widget/common/empty_sized_box_text.dart';

class PPastActivitiesListView extends StatelessWidget {
  const PPastActivitiesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<PPastActivitiesListViwController>(
      getController: PPastActivitiesListViwController(),
      onPageBuilder: (context, PPastActivitiesListViwController controller) =>
          Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.pastActivities),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Obx(
            () => controller.fetchedpastActivity.isEmpty
                ? EmptySizedBoxText()
                : pastActivitiesListView(controller),
          ),
        ),
      ),
    );
  }

  ListView pastActivitiesListView(PPastActivitiesListViwController controller) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TActivityModel? activityModel =
            controller.fetchedpastActivity[index];
        return activityThreeRowBox(
            () {},
            () {},
            DemoInformation.titlenameActivityMod(
                activityModel?.title ?? "empty title"),
            DemoInformation.clockRow(
                activityModel?.dateTime ?? Timestamp.now()),
            ActivityTextUtil.watchTheRecording,
            DemoInformation.therapistnameActivityMod(
                activityModel?.therapistName ?? "empty therapist name"));
      },
      itemCount: controller.fetchedpastActivity.length,
    );
  }
}
