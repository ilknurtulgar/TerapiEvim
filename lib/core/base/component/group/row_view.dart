import 'package:flutter/material.dart';

import '../../ui_models/row_model.dart';
import '../../util/base_utility.dart';

///TODO: it should be a class
class RowView extends StatelessWidget {
  RowView(
      {super.key,
      required this.padding,
      required this.rowModel,
      this.innerPadding});
  final EdgeInsets padding;
  final RowModel rowModel;
  final EdgeInsets? innerPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: rowModel.isAlignmentBetween
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rowModel.leadingIcon ?? Container(),
          Expanded(
            child: Padding(
              padding: innerPadding ?? EdgeInsets.zero,
              child: texts(rowModel),
            ),
          ),
          rowModel.trailingIcon!
        ],
      ),
    );
  }
}

// Widget rowView(RowModel rowModel, EdgeInsets padding,
//     [EdgeInsets? innerPadding]) {
//   return Padding(
//     padding: padding,
//     child: Row(
//       mainAxisAlignment: rowModel.isAlignmentBetween
//           ? MainAxisAlignment.spaceBetween
//           : MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         rowModel.leadingIcon ?? Container(),
//         Expanded(
//           child: Padding(
//             padding: innerPadding ?? EdgeInsets.zero,
//             child: texts(rowModel),
//           ),
//         ),
//         rowModel.trailingIcon!
//       ],
//     ),
//   );
// }

Widget texts(RowModel rowModel) {
  return Row(
    mainAxisAlignment: rowModel.isAlignmentBetween == false
        ? MainAxisAlignment.start
        : MainAxisAlignment.center,
    children: [
      responsivenestext(rowModel.text, rowModel.textStyle),
      responsivenestext(rowModel.text2!, rowModel.textStyle2),
    ],
  );
}
