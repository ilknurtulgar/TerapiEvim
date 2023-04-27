import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../controller/participant/activity/p_past_acitivities_list_view_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';

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
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              final TActivityModel? activityModel =
                                  controller.fetchedpastActivity[index];
                              return activitythreerowbox(
                                  () {},
                                  () {},
                                  DemoInformation.titlenameActivityMod(
                                      activityModel?.title ?? "empty title"),
                                  DemoInformation.clockRow(
                                      activityModel?.dateTime ??
                                          Timestamp.now()),
                                  ActivityTextUtil.watchTheRecording,
                                  DemoInformation.therapistnameActivityMod(
                                      activityModel?.therapistName ??
                                          "empty therapist name"));
                            },
                            itemCount: controller.fetchedpastActivity.length,
                          ),
                  ),
                )));
  }
}
