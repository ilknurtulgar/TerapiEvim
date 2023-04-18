import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';

import '../../../controller/therapist/activity/t_activity_list_view_controller.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import '../../../product/widget/common/activity/search.dart';
import '../../../product/widget/t_activity/t_sliver_type_widget.dart';

class TActivityListView extends StatelessWidget {
  const TActivityListView({super.key});
//aktiviteler
  @override
  Widget build(BuildContext context) {
    return BaseView<TActivityListViewController>(
      getController: TActivityListViewController(),
      onPageBuilder: (context, TActivityListViewController controller) {
        return Scaffold(
          appBar: Search(rowModel: UiBaseModel.searchRow()),
          body: Padding(
              padding: AppPaddings.pagePadding,
              child: Obx(
                () => SliverType(
                    activityType: ActivityType.activity,
                    arrowOnTap: () {},
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.activity.length,
                      (context, index) {
                        final TActivityModel? activityModel =
                            controller.activity[index];

                        return activitythreerowbox(
                          () {},
                          () {},
                          DemoInformation.myPastActivities(
                              activityModel?.title ?? ""),
                          DemoInformation.myPastActivitiesTime(
                              activityModel?.dateTime ?? Timestamp.now()),
                          ActivityTextUtil.join,
                          DemoInformation.ayrowmodel,
                        );
                      },
                    )),
              )),
        );
      },
    );
  }
}
