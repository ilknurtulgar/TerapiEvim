import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';

import '../../../../../core/base/util/base_utility.dart';
import '../../../../screen/therapist/home/home.dart';
import 'row_view.dart';

// ignore: must_be_immutable
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
    width ??= Responsive.width(SizeUtil.generalWidth, context);
    height ??= Responsive.height(SizeUtil.generalHeight, context);
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: padding ?? const EdgeInsets.only(bottom: 16),
          height: height,
          width: width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.dustyGray.withOpacity(0.7),
                  blurRadius: 0.6, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                )
              ],
              border: Border.all(color: borderColor!.withOpacity(0.8)),
              borderRadius: AppBorderRadius.generalBorderRadius,
              color: AppColors.white),
          child: rowView(row, AppPaddings.rowViewPadding)),
    );
  }
}
