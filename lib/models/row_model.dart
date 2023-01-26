import 'package:flutter/material.dart';

class RowModel {
  Widget? leadingIcon;
  String text;
  Widget? trailingIcon;
  RowModel({
    this.leadingIcon,
    required this.text,
    this.trailingIcon,
  });
}

Widget row_view(RowModel rowModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowModel.leadingIcon!,
        Text(rowModel.text, style: TextStyle(fontSize: 14)),
        rowModel.trailingIcon!
      ],
    ),
  );
}
