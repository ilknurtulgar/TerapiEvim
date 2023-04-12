import 'package:flutter/material.dart';

import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

class DateTextField extends StatelessWidget {
  const DateTextField(
      {super.key,
      required this.textController,
      required this.isBig,
      required this.dateTapped});
  final TextEditingController textController;
  final bool isBig;
  final Function() dateTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: CustomTextField(
        isOne: true,
        textController: textController,
        onTap: dateTapped,
        rowModel: RowModel(
            text: "",
            textStyle: const TextStyle(color: AppColors.black),
            text2: 'gg/aa/yyyy',
            isAlignmentBetween: false,
            leadingIcon: IconUtility.calendarIcon),
        isBig: isBig,
        isRowModel: true,
      ),
    );
  }
}
