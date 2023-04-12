import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/activity/t_update_activity_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../group/group_add/t_group_add_view.dart';
import 't_new_activity_view.dart';

class TUpdateActivityView extends StatelessWidget {
  const TUpdateActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TUpdateActivityViewController>(
      onModelReady: (model) {
        model.setContext(context);
      },
      getController: TUpdateActivityViewController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.update),
        body: Column(
          children: [
            miniHeadings(ActivityTextUtil.eventName, false, false),
            miniHeadings(ActivityTextUtil.eventAbout, false, false),
            butterFlyButton(ActivityTextUtil.update, () {
              controller.updateActivity();
            })
          ],
        ),
      ),
    );
  }
}
