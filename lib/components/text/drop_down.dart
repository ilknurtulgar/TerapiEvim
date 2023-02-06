import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/components/text/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/service/activity_controller.dart';

final List<String> variables = ["seçiniz", "male", "famele"];

class DropDown extends StatelessWidget {
  DropDown({super.key});

  ActivityController activityController = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            activityController.changeBox();
            print("tiklandş");
          },
          child: Obx(
            () => Container(
              child: activityController.selectedBox.value
                  ? Text(variables[0])
                  : Container(child: ChooseGender()),
              /*  width: 342,
              height: 56,*/
              decoration: boxDecoration(),
            ),
          ),
        ),
      ],
    );
  }
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: AppColors.doveGray, spreadRadius: 1)]);
}

class ChooseGender extends StatelessWidget {
  ChooseGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
            onPressed: () {
              activityController.changeBox();
              print("tiklandii");
            },
            child: Text(variables[1])),
        SimpleDialogOption(
          onPressed: () {
            activityController.changeBox();
            print("okey,letsgo");
          },
          child: Text(variables[2]),
        )
      ],
    );
  }
}

/*ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MaterialButton(
            height: 45,
            minWidth: 300,
            onPressed: () {
              activityController.changeBox();
            },
            color: AppColors.white,
            child: Text(variables[index]));
      },
      itemCount: variables.length,
    );
    InkWell(
          onTap: () {
            activityController.changeBox();
            print("tiklandş");
          },
          child: Obx(
            () => Container(
              child: activityController.selectedBox.value
                  ? Text("")
                  : ChooseGender(),
              width: 342,
              height: 56,
              decoration: boxDecoration(),
            ),
          ),
        ),*/