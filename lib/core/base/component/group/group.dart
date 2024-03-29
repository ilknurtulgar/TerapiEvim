import 'package:flutter/material.dart';

import '../../../../../core/base/util/base_utility.dart';
import 'row_view.dart';
import '../../ui_models/row_model.dart';

// ignore: must_be_immutable
class GroupClass extends StatelessWidget {
  GroupClass({
    super.key,
    this.heading,
    this.width = SizeUtil.largeValueWidth,
    this.isBorderPurple = false,
    required this.onTap,
    required this.row1,
    required this.row2,
    this.row3,
  });
  final bool? isBorderPurple;
  final Function()? onTap;
  final RowModel row1;
  final RowModel row2;
  final RowModel? row3;
  final String? heading;
  double? width;

  @override
  Widget build(BuildContext context) {
    row3 ??
        RowModel(
            text: '', textStyle: const TextStyle(), isAlignmentBetween: false);

    return Padding(
      padding: AppPaddings.componentPadding,
      child: InkWell(
        onTap: onTap,
        child: Material(
          elevation: 5,
          shadowColor:
              isBorderPurple! ? AppColors.cornFlowerBlue : AppColors.dustyGray,
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.generalBorderRadius,
          ),
          child: Container(
            width: width,
            decoration: isBorderPurple!
                ? AppBoxDecoration.purpleBorder
                : AppBoxDecoration.sendDecoration,
            child: Padding(
              padding: AppPaddings.componentPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heading == null
                      ? const SizedBox.shrink()
                      : groupHeading(heading!),
                  RowView(rowModel: row1, padding: AppPaddings.rowViewPadding),
                  RowView(rowModel: row2, padding: AppPaddings.rowViewPadding),
                  row3 != null
                      ? RowView(
                          rowModel: row3!, padding: AppPaddings.rowViewPadding)
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center groupHeading(String heading) {
    return Center(
      child: Text(
        heading,
        style: AppTextStyles.heading(false),
      ),
    );
  }
}
