import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../ui_models/card_model.dart';
import '../buttons/custom_button.dart';
import 'custom_container.dart';
// bu component MethodDownloadingContainer Ve NotificationFromTherContainer ı birleştiriyor
// şu an baş etme metotları üzerinde çalışıldığı için yukarıdaki iki component dosyasını kaldırmadım
class HomeComponent extends StatelessWidget {
  const HomeComponent({
    super.key,
    required this.isForMethodReading,
    required this.cardModel,
    this.time,
    this.title,
    required this.explanation,
    required this.buttonOnTap,
    required this.buttonText,
  });
  final bool isForMethodReading;
  final CardModel cardModel;
  final String? time; // metot okuma amaçlı ise time ve title dolu olmalı
  final String? title; // terapistten gelen bildirimi göstermek amaçlı ise time ve title boş
  final String explanation;
  final Function() buttonOnTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      containerModel: AppContainers.classicWhiteContainer,
      isThereCardModel: true,
      cardModel: cardModel,
      time: time,
      widget: Padding(
        padding: AppPaddings.customContainerInsidePadding(1),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          title != null ? text(true,title!) : const SizedBox(),
          text(false,explanation),
          Padding(
            padding: AppPaddings.customContainerInsidePadding(2),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                textColor: AppColors.white,
                container: AppContainers.purpleButtonContainer(
                    isForMethodReading
                        ? SizeUtil.normalValueWidth
                        : SizeUtil.smallValueWidth),
                onTap: buttonOnTap,
                text: buttonText,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Text text(bool isTitle,String text) {
    return Text(
          text,
          style: isTitle ? AppTextStyles.profileTextStyles(false,true) :  AppTextStyles.normalTextStyle('medium', false),
        );
  }
}
