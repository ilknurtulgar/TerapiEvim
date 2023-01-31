import 'package:flutter/material.dart';
import 'package:terapievim/models/row_model.dart';

import '../../core/base/util/base_utility.dart';
import '../../models/model_view/row_view.dart';

class PersonMin extends StatelessWidget {
  PersonMin(
      {super.key,
      this.width,
      this.height,
      this.border_color,
      required this.onTap,
      required this.row,
      this.padding});
  final EdgeInsets? padding;
  final RowModel row;
  final Function onTap;
  Color? border_color;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    border_color ??= AppColors.dustyGray;
    width ??= 342;
    height ??= 52;
    return InkWell(
      onTap: () => onTap,
      child: Container(
          margin: padding == null ? EdgeInsets.only(bottom: 16) : padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.dustyGray.withOpacity(0.7),
                  blurRadius: 0.6, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  // offset: Offset(
                  //   5.0, // Move to right 5  horizontally
                  //   5.0, // Move to bottom 5 Vertically
                  // ),
                )
              ],
              border: Border.all(color: border_color!.withOpacity(0.8)),
              borderRadius: AppBorderRadius.generalBorderRadius,
              color: AppColors.white),
          child: rowView(row)),
    );
  }
}
