import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/models/container_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.containerModel,
      required this.cardModel,
      this.time,
      this.widget});
  final ContainerModel containerModel;
  final CardModel cardModel;
  final String? time;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    //center niye?
    return Center(
      child: Card(
        elevation: 5,
        color: containerModel.backgroundColor,
        shadowColor: containerModel.shadowColor,
        shape: customContainerShape(),
        child: SizedBox(
          width: containerModel.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
      leading: CustomCircleAvatar(
          imagePath: cardModel.imagePath, big: false, shadow: false),
      title: Text(
        cardModel.title,
        style: AppTextStyles.normalTextStyle('medium', false),
      ),
      subtitle:
          cardModel.subtitle != null ? Text(cardModel.subtitle ?? "") : null,
      trailing: Text(time ?? ""),
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
