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
  GroupController groupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.componentPadding,
      padding: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.purpleBorder,
      // height: SizeUtil.largeValueHeight,
      child: Column(children: [
        const CustomHeading(
          padding: AppPaddings.rowViewPadding,
          isalignmentstart: false,
          isToggle: true,
          text: DemoInformation.question,
        ),
        selecttoggle(),
      ]),
    );
  }

  Obx selecttoggle() {
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
