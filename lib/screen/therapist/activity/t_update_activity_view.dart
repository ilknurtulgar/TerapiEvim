import 'package:flutter/material.dart';



import '../../../controller/therapist/activity/t_update_activity_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../group/group_add/t_group_add_view.dart';

import '../../../product/widget/common/group/mini_headings.dart';
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
