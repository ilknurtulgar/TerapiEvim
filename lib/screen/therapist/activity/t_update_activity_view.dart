import 'package:flutter/material.dart';
import 'package:terapievim/product/widget/common/button/butterfly_button.dart';
import 'package:terapievim/product/widget/common/textfield/text_field.dart';

import '../../../controller/therapist/activity/t_update_activity_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../group/group_add/t_group_add_view.dart';

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
            EventName(
                activityNameController: controller.activityNameController),
            miniHeadings(ActivityTextUtil.eventAbout, false, false),
            EventAbout(
                activityDescriptionController:
                    controller.activityDescriptionController),
            ButterFlyButton(
                buttonName: ActivityTextUtil.update,
                buttonOnTap: () {
                  controller.updateActivity();
                })
          ],
        ),
      ),
    );
  }
}
