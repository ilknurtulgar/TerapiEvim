import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/row_model.dart';
import 'package:terapievim/service/activity_controller.dart';

ActivityController controller = Get.put(ActivityController());

class Filterbox extends StatelessWidget {
  Filterbox({super.key, required this.rowModel});
  RowModel rowModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(rowModel.text),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: clickbox(),
        )
      ]),
    );
  }
}

InkWell clickbox() {
  return InkWell(
    onTap: (() {
      controller.iconFilter();
    }),
    child: Container(
      height: 35,
      width: 35,
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.black, width: 1)),
    ),
  );
}

RowModel rowModel = RowModel(
    isAlignmentBetween: true,
    text: "cxçxççxç",
    textStyle: TextStyle(),
    leadingIcon: clickbox());
