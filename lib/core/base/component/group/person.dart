import 'package:flutter/material.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';

import '../../../../../core/base/util/base_utility.dart';
import 'row_view.dart';

// ignore: must_be_immutable
class PersonMin extends StatelessWidget {
  PersonMin({
    super.key,
    this.isBorderPurple = false,
    required this.onTap,
    required this.row,
  });

  final RowModel row;
  final Function() onTap;
  bool isBorderPurple;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: AppPaddings.componentPadding,
          height: Responsive.height(SizeUtil.generalHeight, context),
          width: Responsive.width(SizeUtil.generalWidth, context),
          // ignore: unrelated_type_equality_checks
          decoration: isBorderPurple == Null
              ? AppBoxDecoration.sendDecoration
              : !isBorderPurple
                  ? AppBoxDecoration.purpleBorder
                  : AppBoxDecoration.sendDecoration,
          child: RowView(rowModel: row, padding: AppPaddings.rowViewPadding)),
    );
  }
}
