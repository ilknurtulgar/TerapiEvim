import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/ui_models/card_model.dart';
import 'package:terapievim/core/base/ui_models/container_model.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      required this.containerModel,
      required this.isThereCardModel,
      this.cardModel,
      this.time,
      this.widget,
      this.isThereShadow});
  final ContainerModel containerModel;
  final bool isThereCardModel;
  final CardModel? cardModel;
  final String? time;
  final Widget? widget;
  bool? isThereShadow;
  @override
  Widget build(BuildContext context) {
    isThereShadow ??= true;
    return Center(
      child: Padding(
        padding: AppPaddings.componentPadding,
        child: Card(
          elevation: isThereShadow! ? 5 : 0,
          color: containerModel.backgroundColor,
          shadowColor: containerModel.shadowColor,
          shape: customContainerShape(),
          child: SizedBox(
            height: widget == null ? containerModel.height : null,
            width: (widget == null && containerModel.width != null)
                ? containerModel.width
                : context.width1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: widget == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                isThereCardModel ? listTile() : const SizedBox(),
                widget ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile listTile() {
    return ListTile(
      leading: CustomCircleAvatar(imagePath: cardModel!.imagePath, big: false, shadow: false),
      title: Text(
        cardModel!.title,
        style: AppTextStyles.normalTextStyle('medium', false),
      ),
      subtitle: cardModel!.subtitle != null ? Text(cardModel!.subtitle ?? "") : null,
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
