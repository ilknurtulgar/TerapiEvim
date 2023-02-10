import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class ToggleQuestions extends StatelessWidget {
  ToggleQuestions({super.key});
  GroupController groupController = Get.put(GroupController());

  List toggletext = ["hiç", "çok az", "orta", "fazla", "aşırı"];
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
          constraints: const BoxConstraints(minHeight: 3, minWidth: 3),
          children: groupController.choice,
          borderWidth: 20,
          isSelected: groupController.selectedchoice),
    );
  }
}

Container togglebuttonsview() {
  return Container(
    decoration: AppBoxDecoration.lockScreenBox,
    width: 341,
    child: Column(children: [
      CustomHeading(
          isToggle: true,
          text:
              "1.Yasemini insanlar 100 üzerinden  ne kadar severlerse yasemin ne kadar mutlu olur?(Cevap yok hehe)"),
      ToggleQuestions(),
    ]),
  );
}
