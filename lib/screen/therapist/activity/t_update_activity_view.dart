import 'package:flutter/material.dart';

import '../../../controller/therapist/activity/t_update_activity_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../product/widget/common/button/butterfly_button.dart';
import '../../../product/widget/common/textfield/text_field.dart';

import '../../../product/widget/common/group/mini_headings.dart';

class TUpdateActivityView extends StatelessWidget {
  const TUpdateActivityView({super.key, required this.activity});
  final TActivityModel activity;
  @override
  Widget build(BuildContext context) {
    return BaseView<TUpdateActivityViewController>(
      onModelReady: (model) {
        model.setContext(context);
        model.setActivity(activity);
      },
      getController: TUpdateActivityViewController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ActivityTextUtil.update),
        body: Column(
          children: [
            MiniHeading(
                name: ActivityTextUtil.eventName,
                isInMiddle: false,
                isAlignedInCenter: false),
            EventName(
                activityNameController: controller.activityNameController),
            MiniHeading(
                name: ActivityTextUtil.eventAbout,
                isInMiddle: false,
                isAlignedInCenter: false),
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
