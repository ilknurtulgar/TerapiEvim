import 'package:flutter/material.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../activity/t_new_activity_view.dart';

class TAddHoursView extends StatelessWidget {
  const TAddHoursView({super.key});

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
