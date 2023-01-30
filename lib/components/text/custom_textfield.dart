import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/row_model.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.rowModel})
      : super(key: key);
  String? labelText;
  String? hintText;
  RowModel rowModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            labelText: rowModel.text,
            icon: rowModel.trailingIcon,
            prefix: rowModel.leadingIcon,
            hintText: hintText,
            enabledBorder: Bordercolor(),
            focusedBorder: Bordercolor(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ));
  }

  OutlineInputBorder Bordercolor() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: AppColors.dustyGray,
      width: 2,
    ));
  }
}

RowModel trailingModel = RowModel(
    text: "cx",
    trailingIcon: InkWell(
      onTap: (() {
        print("tiklandi");
      }),
      child: IconUtility.visibilityIcon,
    ));
RowModel leadingModel =
    RowModel(text: "cx", leadingIcon: IconUtility.emailIcon);
