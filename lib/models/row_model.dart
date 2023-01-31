import 'package:flutter/material.dart';

class RowModel {
  Widget? leadingIcon;
  String text;
  Widget? trailingIcon;

  RowModel({
    this.leadingIcon,
    required this.text,
    this.trailingIcon,
  }) {
    leadingIcon ??= space();
    trailingIcon ??= space();
  }

  SizedBox space() => SizedBox();
}
