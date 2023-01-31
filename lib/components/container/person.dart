import 'package:flutter/material.dart';
import 'package:terapievim/models/row_model.dart';

import '../../core/base/util/base_utility.dart';
import '../../models/model_view/row_view.dart';

class PersonMin extends StatelessWidget {
  PersonMin({
    super.key,
    this.width,
    this.height,
    this.border_color,
    required this.onTap,
    required this.row,
  });
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
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: border_color!.withOpacity(1)),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white),
          child: rowView(row)),
    );
  }
}
