import 'package:flutter/material.dart';

import '../row_model.dart';

Widget rowView(RowModel rowModel) {
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
