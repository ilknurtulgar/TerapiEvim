import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class ToggleQuestions extends StatelessWidget {
  ToggleQuestions({super.key});
  GroupController groupController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ToggleButtons(
          direction: Axis.horizontal,
          onPressed: ((int index) {
            groupController.selecttooggle(index);
          }),
          borderRadius: BorderRadius.circular(3),
          borderColor: Colors.transparent,
          selectedBorderColor: Colors.transparent,
          fillColor: Colors.transparent,
          selectedColor: AppColors.cornFlowerBlue,
          splashColor: AppColors.transparent,
          constraints: BoxConstraints(minHeight: 3, minWidth: 3),
          children: groupController.choice,
          borderWidth: 20,
          isSelected: groupController.selectedchoice),
    );
  }
}
