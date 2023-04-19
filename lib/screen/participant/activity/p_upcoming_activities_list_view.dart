import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';

import '../../../controller/participant/activity/p_upcoming_activities_list_view_controller.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';
import '../../../product/widget/common/activity/search.dart';
import '../../../product/widget/t_activity/t_sliver_type_widget.dart';

class PUpComingActivitiesListView extends StatelessWidget {
  const PUpComingActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PUpComingActivitiesListViewController>(
      getController: PUpComingActivitiesListViewController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: Search(rowModel: UiBaseModel.searchRow()),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Obx(
            () => SliverType(
                activityType: ActivityType.upcomingActivities,
                arrowOnTap: () {},
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final TActivityModel? activityModel =
                        controller.upComingActivities[index];
                    return activitythreerowbox(() {
                      controller.joinActivity(context, activityModel!);
                    },
                        () {},
                        DemoInformation.titlenameActivityMod(
                            activityModel?.title ?? "empty title"),
                        DemoInformation.clockRow(
                            activityModel?.dateTime ?? Timestamp.now()),
                        ActivityTextUtil.join,
                        DemoInformation.therapistnameActivityMod(
                            activityModel?.therapistName ??
                                "empty therapist name"));
                  },
                  childCount: controller.upComingActivities.length,
                )),
          ),
        ),
      ),
    );
  }
}
