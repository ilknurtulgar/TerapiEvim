import 'package:flutter/material.dart';
import 'package:terapievim/controller/participant/activity/p_upcoming_activities_list_view_controller.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/product/widget/common/activity/search.dart';
import 'package:terapievim/product/widget/t_activity/t_sliver_type_widget.dart';

import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/activity/activity_boxes.dart';

class PUpComingActivitiesListView extends StatelessWidget {
  const PUpComingActivitiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PUpComingActivitiesListViewController>(
      getController: PUpComingActivitiesListViewController(),
      onPageBuilder: (context, value) => Scaffold(
        appBar: Search(rowModel: UiBaseModel.searchRow()),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: SliverType(
            activityType: ActivityType.upcomingActivities,
            arrowOnTap: () {},
            sLiverListWidget: activitythreerowbox(
                () {},
                () {},
                DemoInformation.recentActivity("Sema koyu"),
                DemoInformation.clockRow,
                ActivityTextUtil.join,
                DemoInformation.ayrowmodel),
            childCount: 3,
          ),
        ),
      ),
    );
  }
}
