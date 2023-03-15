import 'package:flutter/material.dart';

import '../../../init/managers/responsiveness_manager.dart';
import '../../models/row_model.dart';

Widget rowView(
  RowModel rowModel,
  EdgeInsets padding,
) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: rowModel.isAlignmentBetween
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowModel.leadingIcon!,
        Padding(
          padding: EdgeInsets.only(
              left: rowModel.isAlignmentBetween == false ? 15 : 0),
          child: texts(rowModel),
        ),
        rowModel.trailingIcon!
      ],
    ),
  );
}

Widget texts(RowModel rowModel) {
  return Row(
    children: [
      Text(
        rowModel.text,
        style: rowModel.textStyle,
        textScaleFactor: ResponsivenessManager.instance.widthFactorMax1 ,
      ),
      Text(
        rowModel.text2!,
        style: rowModel.textStyle2,
      ),
    ],
  );
}
