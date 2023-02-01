import 'package:flutter/material.dart';

import 'row_model.dart';

Widget rowView(RowModel rowModel, EdgeInsets padding) {
  return Padding(
    padding: padding,
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
