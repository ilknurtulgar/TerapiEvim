import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/card_model.dart';
import '../buttons/custom_button.dart';
import 'custom_container.dart';
class NotificationFromTherContainer extends StatelessWidget { // notification from therapist container
  const NotificationFromTherContainer({super.key,
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
      cardModel: cardModel,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(padding: const EdgeInsets.only(left: 20),child: Text(explanation,textAlign: TextAlign.left,style: AppTextStyles.normalTextStyle('small',false),)),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: AppPaddings.purpleButtonAtRight,
            child: CustomButton(container: AppContainers.purpleButtonContainer, onTap: buttonOnTap,text: buttonText,)))
      ]),
    );
  }
}