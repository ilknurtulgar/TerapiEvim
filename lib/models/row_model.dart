import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RowModel {
  Widget? leadingIcon;
  String text;
  String? text2;
  TextStyle textStyle;
  TextStyle? textStyle2;
  Widget? trailingIcon;
  bool isAlignmentBetween;

  RowModel({
    this.leadingIcon,
    required this.text,
    required this.textStyle,
    this.text2,
    this.textStyle2,
    this.trailingIcon,
    required this.isAlignmentBetween,
  }) {
    leadingIcon ??= space();
    trailingIcon ??= space();
    text2 ??= "";
    textStyle2 ??= TextStyle(fontSize: 15);
  }

  SizedBox space() => SizedBox(
        height: 20,
        width: 20,
      );
}
