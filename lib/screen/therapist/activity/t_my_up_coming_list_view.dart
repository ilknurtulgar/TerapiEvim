import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ActivityBox(
                      leftButtonTapped: () {},
                      istwobutton: true,
                      buttonText: ActivityTextUtil.start,
                      containerModel: AppContainers.containerButton(false),
                      isactivity: true,
                      rightButtonTap: () {},
                      arowModel: DemoInformation.recentActivityTitle('Empty'),
                      clockModel:
                          DemoInformation.recentActivityTime(Timestamp.now()));
                },
                itemCount: 2,
              ),
            ));
      },
    );
  }
}
