import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/activity/t_my_activity_list_view_controller.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/product/widget/t_activity/t_sliver_type_widget.dart';

import '../../../product/widget/common/activity/search.dart';

class TMyActivityListView extends StatelessWidget {
  const TMyActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TMyActivityListViewController>(
      getController: TMyActivityListViewController(),
      onPageBuilder: (context, value) {
        return Scaffold(
            appBar: Search(
              rowModel: UiBaseModel.searchRow(),
            ),
            body: SliverType(activityType: ActivityType.myactivity));
      },
    );
  }
}
