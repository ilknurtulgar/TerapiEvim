import 'package:flutter/material.dart';

import '../../core/base/util/base_utility.dart';
import '../../model_view/row_view.dart';
import '../../models/row_model.dart';

class SeminarMin extends StatelessWidget {
  SeminarMin(
      {super.key,
      this.width,
      this.height,
      this.border_color,
      required this.onTap,
      required this.row});

  final Function onTap;
  Color? border_color;
  final RowModel row;
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
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: border_color!.withOpacity(1)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: row_view(row),
      ),
    );
  }
}

class SeminarMax extends StatelessWidget {
  SeminarMax({
    super.key,
    this.width,
    this.height,
    this.border_color,
    required this.onTap,
    required this.row1,
    required this.row2,
    required this.row3,
  });
  final RowModel row1;
  final RowModel row2;
  final RowModel row3;

  final Function onTap;
  Color? border_color;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    border_color ??= AppColors.dustyGray;
    width ??= 342;
    height ??= 120;
    return InkWell(
      onTap: () => onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: border_color!.withOpacity(1)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [row_view(row1), row_view(row2), row_view(row3)],
        ),
      ),
    );
  }
}