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
    leadingIcon ??= Space();
    trailingIcon ??= Space();
  }
  Widget Space() {
    return SizedBox(
      height: 0,
      width: 0,
    );
  }
}
