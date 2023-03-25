import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/activity/new_activity_screen.dart';

import '../../../core/base/util/base_utility.dart';

class AddHoursScreen extends StatelessWidget {
  const AddHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          children: [
            secappview(
              UiBaseModel.secRowModel(
                closeIcon(() {
                  context.pop();
                }),
                ActivityTextUtil.addNewClock,
              ),
            ),
            minheading(ActivityTextUtil.date),
            minheading(ActivityTextUtil.addClock),
            minheading(ActivityTextUtil.clocks),
            butterFlyButton(ActivityTextUtil.save, () {})
          ],
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
