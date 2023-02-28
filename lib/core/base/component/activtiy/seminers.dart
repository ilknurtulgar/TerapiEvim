import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/group/util/lock_screen_utility.dart';
import '../../util/base_utility.dart';
import '../group/row_view.dart';
import '../../models/row_model.dart';

// ignore: must_be_immutable
class SeminarMin extends StatelessWidget {
  SeminarMin(
      {super.key,
      this.width,
      this.height,
      this.borderColor,
      required this.onTap,
      required this.row});

  final Function()? onTap;
  Color? borderColor;
  final RowModel row;
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
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!.withOpacity(1)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: rowView(row, Paddings.rowViewPadding),
      ),
    );
  }
}

// ignore: must_be_immutable
class SeminarMax extends StatelessWidget {
  SeminarMax({
    super.key,
    this.width,
    this.height,
    this.borderColor,
    required this.onTap,
    required this.row1,
    required this.row2,
    required this.row3,
  });
  final RowModel row1;
  final RowModel row2;
  final RowModel row3;

  final Function() onTap;
  Color? borderColor;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    borderColor ??= AppColors.dustyGray;
    width ??= 342;
    height ??= 120;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!.withOpacity(1)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowView(row1, Paddings.rowViewPadding),
            rowView(row2, Paddings.rowViewPadding),
            rowView(row3, Paddings.rowViewPadding)
          ],
        ),
      ),
    );
  }
}
