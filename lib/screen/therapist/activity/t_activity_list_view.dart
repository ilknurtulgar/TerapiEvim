import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';

import '../../../controller/therapist/activity/t_activity_list_view_controller.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';

class TActivityListView extends StatelessWidget {
  const TActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TActivityListViewController>(
      getController: TActivityListViewController(),
      onPageBuilder: (context, TActivityListViewController controller) {
        return Scaffold(
            appBar: MyAppBar(title: ActivityTextUtil.activity),
            body: Padding(
              padding: AppPaddings.pagePadding,
              child: Obx(() => ListView.builder(
                    itemCount: controller.activity.length,
                    itemBuilder: (context, index) {
                      final TActivityModel? activityModel =
                          controller.activity[index];

                      return activitythreerowbox(
                        () {},
                        () {},
                        DemoInformation.myPastActivities(
                            activityModel?.title ?? "empty title"),
                        DemoInformation.myPastActivitiesTime(
                            activityModel?.dateTime ?? Timestamp.now()),
                        ActivityTextUtil.join,
                        DemoInformation.therapistnameActivityMod(
                            "empty therapist name"),
                      );
                    },
                  )),
            ));
      },
    );
  }
}
