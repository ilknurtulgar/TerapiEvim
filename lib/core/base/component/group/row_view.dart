import 'package:flutter/material.dart';

import '../../models/row_model.dart';
import '../../util/base_utility.dart';

Widget rowView(
  RowModel rowModel,
  EdgeInsets padding,
) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: rowModel.isAlignmentBetween
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowModel.leadingIcon!,
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: rowModel.isAlignmentBetween == false ? 15 : 0),
            child: texts(rowModel),
          ),
        ),
        rowModel.trailingIcon!
      ],
    ),
  );
}

Widget texts(RowModel rowModel) {
  return Row(
    mainAxisAlignment:  rowModel.isAlignmentBetween == false ? MainAxisAlignment.start : MainAxisAlignment.center,
    children: [
      responsivenestext(rowModel.text, rowModel.textStyle),
      responsivenestext(rowModel.text2!, rowModel.textStyle2),
    ],
  );
}
