import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';

import '../../../controller/therapist/activity/t_my_up_coming_list_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/group_box.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

class TMyUpComingActivitiesListView extends StatelessWidget {
  const TMyUpComingActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TMyUpComingListViewController>(
      getController: TMyUpComingListViewController(),
      onPageBuilder: (context, TMyUpComingListViewController controller) {
        return Scaffold(
            appBar: MyAppBar(title: ActivityTextUtil.myupcomingActivities),
            body: Padding(
              padding: AppPaddings.pagePaddingHorizontal,
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    final TActivityModel? activity =
                        controller.fetchedActivity[index];
                    return ActivityBox(
                        leftButtonTapped: () {},
                        istwobutton: true,
                        buttonText: ActivityTextUtil.start,
                        containerModel: AppContainers.containerButton(false),
                        isactivity: true,
                        rightButtonTap: () {
                          controller.createMeeting(
                              context: context, activity: activity);
                        },
                        arowModel: DemoInformation.recentActivityTitle(
                            activity?.title ?? "empty tite"),
                        clockModel: DemoInformation.recentActivityTime(
                            activity?.dateTime ?? Timestamp.now()));
                  },
                  itemCount: controller.fetchedActivity.length,
                ),
              ),
            ));
      },
    );
  }
}
