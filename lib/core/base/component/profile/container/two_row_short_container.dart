import 'package:flutter/material.dart';
import '../../../util/base_model.dart';
import '../../buttons/custom_button.dart';
import '../../../util/base_utility.dart';
import '../../group/row_view.dart';

class TwoRowShortContainer extends StatelessWidget {
  const TwoRowShortContainer({
    super.key,
    required this.row1Text,
    required this.row2Text,
    required this.firstIconData,
    required this.secondIconData,
    this.buttonText,
    required this.purpose,
    required this.isThereButton,
  });
  final String row1Text;
  final String row2Text;
  final IconData firstIconData;
  final IconData secondIconData;
  final String? buttonText;
  final String purpose;
  final bool isThereButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
        //left right 24 verince oluyor
        padding: isThereButton
            ? AppPaddings.smallPadding(3)
            : AppPaddings.componentPadding,
        child: Material(
          elevation: 5,
          shadowColor: isThereButton == true && purpose == 'seminar'
              ? AppColors.cornFlowerBlue
              : AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: isThereButton
                ? SizeUtil.doubleNormalValueHeight
                : SizeUtil.doubleSmallValueHeight,
            /*width: isThereButton  // yazıya göre genişleyecek şekilde ayarladım o yüzden width değerlerini kapattım
                ? SizeUtil.largeValueWidth
                : SizeUtil.generalWidth,*/
            decoration: containerDecoration(), //
            child: Padding(
              padding: AppPaddings.customContainerInsidePadding(1),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    rowViewColumn(),
                    isThereButton ? button() : const SizedBox()
                  ]),
            ),
          ),
        ));
  }

  Column rowViewColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        firstRow(),
        secondRow(),
      ],
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
        borderRadius: AppBorderRadius.generalBorderRadius,
        color: AppColors.white,
        border: Border.all(
            color: isThereButton == true && purpose == 'seminar'
                ? AppColors.cornFlowerBlue
                : Colors.grey.withOpacity(0.50),
            width: 2));
  }

  Widget secondRow() {
    return rowView(
        UiBaseModel.normalTextRow(
            row2Text,
            secondIconData,
            AppTextStyles.profileTextStyles(
                false, purpose != 'date' ? true : false)),
        AppPaddings.componentPadding);
  }

  Widget firstRow() {
    return rowView(
        purpose != 'date'
            ? UiBaseModel.normalTextRow(row1Text, firstIconData,
                AppTextStyles.profileTextStyles(false, true))
            : UiBaseModel.doubleTextRow('Danışan: ', row1Text, false),
        isThereButton ? EdgeInsets.zero : AppPaddings.componentOnlyTopPadding);
  }

  Widget button() {
    return CustomButton(
        textColor: AppColors.white,
        container: AppContainers.purpleButtonContainer(null),
        onTap: () {}, // izle ya da dosyayı oku fonksiyonu
        text: buttonText ?? "");
  }
}
