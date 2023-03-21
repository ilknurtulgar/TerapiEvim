import 'package:flutter/material.dart';
import '../../util/base_utility.dart';
import '../group/row_view.dart';
import '../../models/row_model.dart';

// ignore: must_be_immutable
class SeminarMin extends StatelessWidget {
  SeminarMin(
      {super.key,
      //this.width,
      //this.height,
      this.isBorderPurple = false,
      required this.onTap,
      required this.row});

  final Function()? onTap;
  bool isBorderPurple;
  final RowModel row;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeUtil.generalHeight,
        // ignore: unrelated_type_equality_checks
        decoration: isBorderPurple == Null
            ? AppBoxDecoration.sendDecoration
            : !isBorderPurple
                ? AppBoxDecoration.purpleBorder
                : AppBoxDecoration.sendDecoration,
        child: Expanded(child: rowView(row, AppPaddings.rowViewPadding)),
      ),
    );
  }
}
