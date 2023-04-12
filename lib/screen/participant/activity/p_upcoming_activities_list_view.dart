import 'package:flutter/material.dart';

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
