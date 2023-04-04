import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../controller/therapist/group/t_group_controller.dart';
import '../../ui_models/row_model.dart';

// ignore: must_be_immutable
class DeletingTimeButton extends StatelessWidget {
  DeletingTimeButton(
      {super.key,
      required this.rowIndex,
      this.listViewIndex,
      required this.isInMainPage});
  final int rowIndex;
  final int? listViewIndex;
  final bool isInMainPage;

  ///TODO: getx controller kaldırılmalı
  TGroupController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: PersonMin(
          onTap: () {},
          row: RowModel(
            isAlignmentBetween: true,
            text: isInMainPage
                ? controller.timeListsInController[listViewIndex!][rowIndex]
                : controller.tempTimes[rowIndex],
            textStyle: AppTextStyles.normalTextStyle('medium', false),
            leadingIcon: IconUtility.clockIcon,
            trailingIcon: IconButton(
                onPressed: isInMainPage
                    ? () => controller.deleteTimeInMainPage(
                        rowIndex, listViewIndex!)
                    : () => controller.deleteTimeInAddingPage(rowIndex),
                icon: IconUtility.deleteIcon),
          )),
    );
  }
}
