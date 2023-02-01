import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class RowModel {
  Widget? leadingIcon;
  String text;
  String? text2;
  TextStyle textStyle;
  TextStyle? textStyle2;
  Widget? trailingIcon;

  RowModel({
    this.leadingIcon,
    required this.text,
    required this.textStyle,
    this.text2,
    this.textStyle2,
    this.trailingIcon,
  }) {
    leadingIcon ??= space();
    trailingIcon ??= space();
    text2 ??= "";
    textStyle2 ??= AppTextStyles.aboutMeTextStyle(true);
  }

  SizedBox space() => SizedBox(
        height: 20,
        width: 20,
      );
}
