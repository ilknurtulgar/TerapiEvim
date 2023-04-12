import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/activity/t_update_activity_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';

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
            MiniHeading(
                name: ActivityTextUtil.eventAbout,
                isInMiddle: false,
                isAlignedInCenter: false),
            butterFlyButton(ActivityTextUtil.update, () {
              controller.updateActivity();
            })
          ],
        ),
      ),
    );
  }
}
