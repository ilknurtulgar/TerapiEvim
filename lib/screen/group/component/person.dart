import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/group/util/lockScreenutility.dart';

import '../../../../core/base/util/base_utility.dart';
import 'row_view.dart';

class PersonMin extends StatelessWidget {
  PersonMin(
      {super.key,
      this.width,
      this.height,
      this.borderColor,
      required this.onTap,
      required this.row,
      this.padding});
  final EdgeInsets? padding;
  final RowModel row;
  final Function() onTap;
  Color? borderColor;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    borderColor ??= AppColors.dustyGray;
    width ??= 342;
    height ??= 52;
    return InkWell(
      onTap: onTap,
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
              border: Border.all(color: borderColor!.withOpacity(0.8)),
              borderRadius: AppBorderRadius.generalBorderRadius,
              color: AppColors.white),
          child: rowView(row, paddings.rowViewPadding)),
    );
  }
}
