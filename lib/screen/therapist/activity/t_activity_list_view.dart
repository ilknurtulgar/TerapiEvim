import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/activity/t_activity_list_view_controller.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/product/widget/common/activity/search.dart';

import '../../../product/widget/t_activity/t_sliver_type_widget.dart';

class TActivityListView extends StatelessWidget {
  const TActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TActivityListViewController>(
      getController: TActivityListViewController(),
      onPageBuilder: (context, TActivityListViewController controller) {
        return Scaffold(
          appBar: Search(rowModel: UiBaseModel.searchRow()),
          body: Padding(
            padding: AppPaddings.pagePadding,
            child: SliverType(
              activityType: ActivityType.activity,
            ),
          ),
        );
      },
    );
  }
}
