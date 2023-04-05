import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../ui_models/card_model.dart';
import '../buttons/custom_button.dart';
import 'custom_container.dart';

class MethodDownloadingContainer extends StatelessWidget {
  const MethodDownloadingContainer({
    super.key,
    required this.cardModel,
    required this.time,
    required this.explanation,
    required this.buttonOnTap,
    required this.buttonText,
  });
  final CardModel cardModel;
  final String time;
  final String explanation;
  final Function() buttonOnTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      containerModel: AppContainers.classicWhiteContainer,
      isThereCardModel: true,
      cardModel: cardModel,
      time: time, //
      widget: Padding(
        padding: AppPaddings.customContainerInsidePadding(1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            explanation,
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
          Padding(
            padding: AppPaddings.customContainerInsidePadding(2),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                  textColor: AppColors.white,
                  container: AppContainers.purpleButtonContainer(
                      SizeUtil.normalValueWidth),//
                  onTap: buttonOnTap,
                  text: buttonText,),
            ),
          )
        ]),
      ),
    );
  }
}
