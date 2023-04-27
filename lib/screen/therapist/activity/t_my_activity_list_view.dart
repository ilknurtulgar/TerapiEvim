import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/activity/t_my_activity_list_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';

class TMyActivityListView extends StatelessWidget {
  const TMyActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TMyActivityListViewController>(
      getController: TMyActivityListViewController(),
      onPageBuilder: (context, controller) {
        return Scaffold(
          appBar: MyAppBar(
            title: ActivityTextUtil.myActivty,
          ),
          body: Obx(
            () => controller.fetchedMyActivity.isEmpty
                ? Padding(
                    padding: AppPaddings.pagePadding,
                    child: EmptySizedBoxText())
                : ListView.builder(
                    itemCount: controller.fetchedMyActivity.length,
                    itemBuilder: (context, index) {
                      final TActivityModel? activityModel =
                          controller.fetchedMyActivity[index];

                      return Padding(
                        padding: AppPaddings.pagePadding,
                        child: ActivityBox(
                          rightButtonTap: () {},
                          istwobutton: false,
                          buttonText: ActivityTextUtil.watchTheRecording,
                          containerModel: AppContainers.containerButton(true),
                          isactivity: true,
                          arowModel: DemoInformation.myPastActivities(
                              activityModel?.title ?? "empty  title"),
                          clockModel: DemoInformation.myPastActivitiesTime(
                              activityModel?.dateTime ?? Timestamp.now()),
                        ),
                      );
                    }),
          ),
        );
      },
    );
  }
}
