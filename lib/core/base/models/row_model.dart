import 'package:flutter/material.dart';

import '../util/base_utility.dart';

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
    textStyle2 ??= const TextStyle(fontSize: 15);
  }

  SizedBox space() => const SizedBox(
        height: (SizeUtil.smallValueHeight) / 2,
        width: (SizeUtil.lowValueWidth) / 2,
      );
}
