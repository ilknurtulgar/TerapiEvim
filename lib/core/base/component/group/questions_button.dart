import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class ToggleQuestions extends StatefulWidget {
  const ToggleQuestions({super.key});

  @override
  State<ToggleQuestions> createState() => _ToggleQuestionsState();
}

class _ToggleQuestionsState extends State<ToggleQuestions> {
  GroupController groupController = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ToggleButtons(
        direction: Axis.horizontal,
        onPressed: ((int index) {
          groupController.selecttooggle(index);
        }),
        borderRadius: AppBorderRadius.generalBorderRadius,
        borderColor: BorderColorUtil.toggleBorderColor,
        selectedBorderColor: BorderColorUtil.toggleBorderColor,
        fillColor: AppColors.transparent,
        selectedColor: AppColors.cornFlowerBlue,
        splashColor: AppColors.transparent,
        constraints: const BoxConstraints(minHeight: 3, minWidth: 3),
        borderWidth: 20,
        isSelected: groupController.selectedchoice,
        children: groupController.choice,
      ),
    );
  }
}

Container togglebuttonsview() {
  return Container(
    margin: AppPaddings.toggleButtonsPadding,
    decoration: AppBoxDecoration.purpleBorder,
    width: SizeUtil.generalWidth,
    child: Column(children: [
      CustomHeading(
        isalignmentstart: true,
        isToggle: true,
        text: DemoInformation.question,
      ),
      const ToggleQuestions(),
    ]),
  );
}
