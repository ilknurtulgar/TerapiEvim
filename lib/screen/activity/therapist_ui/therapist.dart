import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/activity/component/drop_down.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  ActivityController activityController = ActivityController();
  final List<String> variables = ["seçiniz", "male", "famele"];
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 51,
        width: 340,
        child: TextButton(
          onPressed: () {
            activityController.changeBox();
          },
          child: Text(variables[0]),
        ),
        decoration: AppBoxDecoration.lockScreenBox,
      ),
      Positioned(top: 70, left: 60, child: ChooseGender()),
    ]);
  }
}
