import 'package:flutter/material.dart';

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
                  child: SliverType(
                    activityType: ActivityType.pastactivities,
                    arrowOnTap: () {},
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        activitythreerowbox(
                            () {},
                            () {},
                            DemoInformation.recentActivity("Sema kara"),
                            DemoInformation.clockRow,
                            ActivityTextUtil.watchTheRecording,
                            DemoInformation.ayrowmodel);
                        return null;
                      },
                      childCount: 3,
                    ),
                  ),
                )));
  }
}
