import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/card_model.dart';
import '../buttons/custom_button.dart';
import 'custom_container.dart';

class NotificationFromTherContainer extends StatelessWidget {
  // notification from therapist container
  const NotificationFromTherContainer(
      {super.key,
      required this.cardModel,
      required this.explanation,
      required this.buttonOnTap,
      required this.buttonText});
  final CardModel cardModel;
  final String explanation;
  final Function() buttonOnTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      containerModel: AppContainers.classicWhiteContainer,
      isThereCardModel: true,
      cardModel: cardModel,
      widget: Padding(
        padding: AppPaddings.customContainerInsidePadding(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            explanation,
            textAlign: TextAlign.left,
            style: AppTextStyles.normalTextStyle('small', false),
          ),
          Padding(
              padding: AppPaddings.customContainerInsidePadding(2),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  textColor: Colors.white,
                  container: AppContainers.purpleButtonContainer(SizeUtil.smallValueWidth),
                  onTap: buttonOnTap,
                  text: buttonText,
                ),
              ))
        ]),
      ),
    );
  }
}
