import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';

import '../../../../../core/base/util/base_utility.dart';
import '../../../../screen/therapist/home/home.dart';
import 'row_view.dart';

// ignore: must_be_immutable
class PersonMin extends StatelessWidget {
  PersonMin({
    super.key,
    this.borderColor,
    required this.onTap,
    required this.row,
  });

  final RowModel row;
  final Function() onTap;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    borderColor ??= AppColors.dustyGray;

    return InkWell(
      onTap: onTap,
      child: Container(
          margin: AppPaddings.componentPadding,
          height: Responsive.height(SizeUtil.generalHeight, context),
          width: Responsive.width(SizeUtil.generalWidth, context),
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
