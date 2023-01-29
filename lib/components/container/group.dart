import 'package:flutter/material.dart';

import '../../core/base/util/base_utility.dart';
import '../../models/model_view/row_view.dart';
import '../../models/row_model.dart';

class Group extends StatelessWidget {
  Group({
    super.key,
    required this.heading,
    this.width,
    this.height,
    this.border_color,
    required this.onTap,
    required this.row1,
    required this.row2,
  });
  Color? border_color;
  final Function onTap;
  final RowModel row1;
  final RowModel row2;
  final String heading;

  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width ??= 237;
    height ??= 120;
    border_color ??= AppColors.dustyGray;

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
            RowView(row1),
            RowView(row2),
          ],
        ),
      ),
    );
  }
}
