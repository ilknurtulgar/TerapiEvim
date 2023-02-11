import 'package:flutter/material.dart';

import '../../../../core/base/util/base_utility.dart';
import 'row_view.dart';
import '../../../core/base/models/row_model.dart';
import '../util/lockScreenutility.dart';

class GroupClass extends StatelessWidget {
  GroupClass({
    super.key,
    required this.heading,
    this.width,
    this.height,
    this.borderColor,
    required this.onTap,
    required this.row1,
    required this.row2,
    required this.row3,
  });
  Color? borderColor;
  final Function onTap;
  final RowModel row1;
  final RowModel row2;
  final RowModel row3;
  final String heading;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width ??= 237;
    height ??= 120;
    borderColor ??= AppColors.dustyGray;

    return InkWell(
      onTap: () => onTap,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Center(
                child: Text(
                  heading,
                  style: AppTextStyles.heading(false),
                ),
              ),
            ),
            rowView(row1, paddings.rowViewPadding),
            rowView(row2, paddings.rowViewPadding),
            rowView(row3, paddings.rowViewPadding)
          ],
        ),
      ),
    );
  }
}
