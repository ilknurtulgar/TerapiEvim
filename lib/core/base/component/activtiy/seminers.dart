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
      this.isBorderPurple,
      required this.onTap,
      required this.row});

  final Function()? onTap;
  bool? isBorderPurple;
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
            : !isBorderPurple!
                ? AppBoxDecoration.purpleBorder
                : AppBoxDecoration.sendDecoration,
        child: Expanded(child: rowView(row, AppPaddings.rowViewPadding)),
      ),
    );
  }
}

// ignore: must_be_immutable
class SeminarMax extends StatelessWidget {
  SeminarMax({
    super.key,
    this.isBorderPurple,
    required this.onTap,
    required this.row1,
    required this.row2,
    required this.row3,
  });
  final RowModel row1;
  final RowModel row2;
  final RowModel row3;

  final Function() onTap;
  bool? isBorderPurple;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: SizeUtil.doubleNormalValueHeight,
        width: SizeUtil.generalWidth,
        // ignore: unrelated_type_equality_checks
        decoration: isBorderPurple == Null
            ? AppBoxDecoration.sendDecoration
            : !isBorderPurple!
                ? AppBoxDecoration.purpleBorder
                : AppBoxDecoration.sendDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rowView(row1, AppPaddings.rowViewPadding),
            rowView(row2, AppPaddings.rowViewPadding),
            rowView(row3, AppPaddings.rowViewPadding)
          ],
        ),
      ),
    );
  }
}
