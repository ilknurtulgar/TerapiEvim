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
    this.firstOnTap,
    this.secondOnTap,
    required this.purpose,
  });
  final String row1Text;
  final String row2Text;
  final IconData firstIconData;
  final IconData secondIconData;
  final String? buttonText;
  final Function()? firstOnTap;
  final Function()? secondOnTap;
  final ContainerPurpose purpose;

  @override
  Widget build(BuildContext context) {
    return Padding(
        //left right 24 verince oluyor
        padding: purpose != ContainerPurpose.date
            ? AppPaddings.horizontalListViewPadding(3)
            : AppPaddings.componentPadding,
        child: Material(
          elevation: 5,
          shadowColor: purpose != ContainerPurpose.date
              ? AppColors.cornFlowerBlue
              : AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: SizeUtil.doubleNormalValueHeight,
            width: purpose != ContainerPurpose.date
                ? SizeUtil.hugeValueWidth
                : SizeUtil.generalWidth,
            decoration: containerDecoration(), //
            child: Padding(
              padding: AppPaddings.customContainerInsidePadding(1),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    rowViewColumn(),
                    purpose != ContainerPurpose.date
                        ? button(buttonText!,true,firstOnTap!)
                        : const SizedBox(),
                    purpose == ContainerPurpose.date
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              button('Test Sonucu',false,firstOnTap!),
                              button('Katıl', true,secondOnTap!),
                            ],
                          )
                        : const SizedBox()
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
            color: purpose != ContainerPurpose.date
                ? AppColors.cornFlowerBlue
                : Colors.grey.withOpacity(0.50),
            width: 1));
  }

  Widget secondRow() {
    return rowView(
        UiBaseModel.normalTextRow(
            row2Text,
            secondIconData,
            AppTextStyles.profileTextStyles(
                false, purpose != ContainerPurpose.date ? true : false)),
        AppPaddings.componentPadding);
  }

  Widget firstRow() {
    return rowView(
        purpose != ContainerPurpose.date
            ? UiBaseModel.normalTextRow(row1Text, firstIconData,
                AppTextStyles.profileTextStyles(false, true))
            : UiBaseModel.doubleTextRow('Danışan: ', row1Text, false),
        purpose != ContainerPurpose.date
            ? EdgeInsets.zero
            : AppPaddings.componentOnlyPadding(1));
  }

  Widget button(String buttonText,bool isDarkPurpleColor,Function() onTap) {
    return CustomButton(
        textColor: AppColors.white,
        container: isDarkPurpleColor
            ? AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth)
            : AppContainers.lightPurpleButtonContainer(
                SizeUtil.normalValueWidth,false),
        onTap: onTap, // izle ya da dosyayı oku fonksiyonu
        text: buttonText);
  }
}

enum ContainerPurpose {
  method,
  seminar,
  date,
}
