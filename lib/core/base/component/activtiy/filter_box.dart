import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/controller/activity_controller.dart';

ActivityController controller = Get.put(ActivityController());

class FilterBox extends StatelessWidget {
  const FilterBox({super.key, required this.rowModel});
  final RowModel rowModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      // height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
        borderRadius: AppBorderRadius.generalBorderRadius,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(rowModel.text),
        Padding(
          padding: AppPaddings.generalPadding,
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
