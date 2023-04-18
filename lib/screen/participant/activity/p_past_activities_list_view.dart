import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';

import '../../../controller/participant/activity/p_past_acitivities_list_view_controller.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import '../../../product/widget/common/activity/search.dart';
import '../../../product/widget/t_activity/t_sliver_type_widget.dart';

class PPastActivitiesListView extends StatelessWidget {
  const PPastActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PPastActivitiesListViwController>(
        getController: PPastActivitiesListViwController(),
        onPageBuilder: (context, PPastActivitiesListViwController controller) =>
            Scaffold(
                appBar: Search(rowModel: UiBaseModel.searchRow()),
                body: Padding(
                  padding: AppPaddings.pagePadding,
                  child: Obx(
                    () => SliverType(
                      activityType: ActivityType.pastactivities,
                      arrowOnTap: () {},
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final TActivityModel? activityModel =
                              controller.fetchedpastActivity[index];
                          return activitythreerowbox(
                              () {},
                              () {},
                              DemoInformation.titlenameActivityMod(
                                  activityModel?.title ?? ""),
                              DemoInformation.clockRow(
                                  activityModel?.dateTime ?? Timestamp.now()),
                              ActivityTextUtil.watchTheRecording,
                              DemoInformation.therapistnameActivityMod(
                                  activityModel?.therapistName ?? ""));
                        },
                        childCount: controller.fetchedpastActivity.length,
                      ),
                    ),
                  ),
                )));
  }
}
