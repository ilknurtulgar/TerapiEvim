import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../ui_models/row_model.dart';

// ignore: must_be_immutable
class DeletingTimeButton extends StatelessWidget {
  DeletingTimeButton(
      {super.key,
      required this.time,
      required this.onDeleted});
  final String time;
  final Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: PersonMin(
          onTap: () {},
          row: RowModel(
            isAlignmentBetween: true,
            text: time,
            textStyle: AppTextStyles.normalTextStyle('medium', false),
            leadingIcon: IconUtility.clockIcon,
            trailingIcon: IconButton(
                onPressed: onDeleted,
                icon: IconUtility.deleteIcon),
          )),
    );
  }
}
