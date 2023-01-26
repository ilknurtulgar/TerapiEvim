import 'package:flutter/material.dart';
import 'package:terapievim/components/image/custom_circle_avatar.dart';
import 'package:terapievim/models/card_model.dart';
import 'package:terapievim/models/container_model.dart';

import '../core/base/util/base_utility.dart';
import '../models/row_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.containerModel,
      required this.cardModel,
      required this.time,
      this.widget});
  final ContainerModel containerModel;
  final CardModel cardModel;
  final String time;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: containerModel.backgroundColor,
        shadowColor: containerModel.shadowColor,
        shape: customContainerShape(),
        child: SizedBox(
          height: containerModel.height,
          width: containerModel.width,
          child: Column(
            children: [
              listTile(),
              widget ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  ListTile listTile() {
    return ListTile(
      leading: customCircleAvatar(cardModel.imagePath, false, false),
      title: Text(cardModel.title),
      subtitle: Text(cardModel.subtitle),
      trailing: Text(time),
    );
  }

  RoundedRectangleBorder customContainerShape() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(containerModel.borderRadius),
        side: BorderSide(
            color: containerModel.shadowColor ?? Colors.transparent,
            width: containerModel.shadowColor != null ? 2 : 0));
  }
}

class SeminarMin extends StatelessWidget {
  SeminarMin(
      {super.key,
      required this.icon,
      required this.heading,
      required this.width,
      required this.height,
      required this.border_color});
  final Color border_color;
  final Icon icon;
  final String heading;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final RowModel row =
        RowModel(leadingIcon: icon, text: heading, trailingIcon: Space());
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: border_color.withOpacity(1)),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white),
      child: row_view(row),
    );
  }
}

Widget Space() {
  return SizedBox(
    height: 20,
    width: 20,
  );
}

class SeminarMax extends StatelessWidget {
  SeminarMax({
    super.key,
    required this.icon,
    required this.icon2,
    required this.icon3,
    required this.heading,
    required this.heading2,
    required this.heading3,
    required this.width,
    required this.height,
    required this.border_color,
  });
  final Color border_color;
  final Icon icon;
  final Icon icon2;
  final Icon icon3;
  final String heading;
  final String heading2;
  final String heading3;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final RowModel row =
        RowModel(leadingIcon: icon, text: heading, trailingIcon: Space());
    final RowModel row2 =
        RowModel(leadingIcon: icon2, text: heading2, trailingIcon: Space());
    final RowModel row3 =
        RowModel(leadingIcon: icon3, text: heading3, trailingIcon: Space());
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: border_color.withOpacity(1)),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [row_view(row), row_view(row2), row_view(row3)],
      ),
    );
  }
}

class Group extends StatelessWidget {
  Group({
    super.key,
    required this.icon,
    required this.icon2,
    required this.heading,
    required this.heading2,
    required this.heading3,
    required this.width,
    required this.height,
    required this.border_color,
  });
  final Color border_color;

  final Icon icon;
  final Icon icon2;
  final String heading;
  final String heading2;
  final String heading3;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final RowModel row =
        RowModel(leadingIcon: icon, text: heading2, trailingIcon: Space());
    final RowModel row2 =
        RowModel(leadingIcon: icon2, text: heading3, trailingIcon: Space());

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(color: border_color.withOpacity(1)),
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
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          row_view(row),
          row_view(row2),
        ],
      ),
    );
  }
}

class PersonMin extends StatelessWidget {
  PersonMin({
    super.key,
    required this.icon,
    required this.heading,
    required this.width,
    required this.height,
    required this.border_color,
    required this.icon_trailing,
  });
  final Color border_color;
  final Icon icon;
  final Icon icon_trailing;
  final String heading;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final RowModel row =
        RowModel(leadingIcon: icon, text: heading, trailingIcon: icon_trailing);
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: border_color.withOpacity(1)),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: row_view(row));
  }
}
