import 'package:flutter/material.dart';

import '../row_model.dart';

Widget RowView(RowModel rowModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowModel.leadingIcon!,
        Texts(rowModel),
        rowModel.trailingIcon!
      ],
    ),
  );
}

Widget Texts(RowModel rowModel) {
  return Row(
    children: [
      Text(
        rowModel.text,
        style: rowModel.textStyle,
      ),
      Text(
        rowModel.text2!,
        style: rowModel.textStyle2,
      ),
    ],
  );
}
