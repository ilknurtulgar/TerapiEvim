import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist/home/session/t_add_hours_view_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../activity/t_new_activity_view.dart';

class TAddHoursView extends StatelessWidget {
  const TAddHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TAddHoursViewController>(
      getController: TAddHoursViewController(),
      onPageBuilder: (context, value) => Scaffold(
        appBar: MyAppBar(
          title: ActivityTextUtil.addNewClock,
        ),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              minheading(ActivityTextUtil.date),
              minheading(ActivityTextUtil.addClock),
              minheading(ActivityTextUtil.clocks),
              butterFlyButton(ActivityTextUtil.save, () {})
            ],
          ),
        ),
      ),
    );
  }

  CustomHeading minheading(String text) {
    return CustomHeading(
      text: text,
      isalignmentstart: true,
      isToggle: false,
    );
  }
}
