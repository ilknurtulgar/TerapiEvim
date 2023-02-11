import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class ToggleQuestions extends StatefulWidget {
  const ToggleQuestions({super.key});

  @override
  State<ToggleQuestions> createState() => _ToggleQuestionsState();
}

class _ToggleQuestionsState extends State<ToggleQuestions> {
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
        borderWidth: 20,
        isSelected: groupController.selectedchoice,
        children: groupController.choice,
      ),
    );
  }
}

Container togglebuttonsview() {
  return Container(
    decoration: AppBoxDecoration.lockScreenBox,
    width: 341,
    child: Column(children: [
      CustomHeading(
          isalignmentstart: true,
          isToggle: true,
          text:
              "1.Yasemini insanlar 100 üzerinden  ne kadar severlerse yasemin ne kadar mutlu olur?(Cevap yok hehe)"),
      const ToggleQuestions(),
    ]),
  );
}
