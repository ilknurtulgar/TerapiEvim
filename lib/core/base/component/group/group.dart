import 'package:flutter/material.dart';

import '../../../../../core/base/util/base_utility.dart';
import 'row_view.dart';
import '../../models/row_model.dart';

// ignore: must_be_immutable
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
    this.row3,
  });
  Color? borderColor;
  final Function onTap;
  final RowModel row1;
  final RowModel row2;
  final RowModel? row3;
  final String heading;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width ??= SizeUtil.lockScreenContainerWidth;
    height ??= SizeUtil.groupHeight;
    borderColor ??= AppColors.dustyGray;

    return InkWell(
      onTap: () => onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Material(
          elevation: 5,
          shadowColor: borderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                border:
                    Border.all(color: borderColor!.withOpacity(1), width: 2),
                borderRadius: AppBorderRadius.generalBorderRadius,
                color: AppColors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: Center(
                    child: Text(
                      heading,
                      style: AppTextStyles.heading(false),
                    ),
                  ),
                ),
                rowView(row1, AppPaddings.rowViewPadding),
                rowView(row2, AppPaddings.rowViewPadding),
                row3 != null
                    ? rowView(
                        row3 ??
                            RowModel(
                                text: '',
                                textStyle: const TextStyle(),
                                isAlignmentBetween: false),
                        AppPaddings.rowViewPadding)
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
