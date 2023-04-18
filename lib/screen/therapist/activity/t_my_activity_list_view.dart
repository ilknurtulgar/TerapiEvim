import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/activity/t_my_activity_list_view_controller.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/product/widget/t_activity/t_sliver_type_widget.dart';

import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../product/widget/common/activity/search.dart';

class TMyActivityListView extends StatelessWidget {
  const TMyActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TMyActivityListViewController>(
      getController: TMyActivityListViewController(),
      onPageBuilder: (context, controller) {
        return Scaffold(
            appBar: Search(
              rowModel: UiBaseModel.searchRow(),
            ),
            body: Obx(
              () => SliverType(
                delegate: SliverChildBuilderDelegate(
                    childCount: controller.fetchedMyActivity.length,
                    (context, index) {
                  final TActivityModel? activityModel =
                      controller.fetchedMyActivity[index];

                  return ActivityBox(
                    rightButtonTap: () {},
                    istwobutton: false,
                    buttonText: ActivityTextUtil.watchTheRecording,
                    containerModel: AppContainers.containerButton(true),
                    isactivity: true,
                    arowModel: DemoInformation.myPastActivities(
                        activityModel?.title ?? ""),
                    clockModel: DemoInformation.myPastActivitiesTime(
                        activityModel?.dateTime ?? Timestamp.now()),
                  );
                }),
                arrowOnTap: () {},
                activityType: ActivityType.myactivity,
              ),
            ));
      },
    );
  }
}
