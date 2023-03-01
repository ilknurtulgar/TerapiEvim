import 'package:flutter/material.dart';
import '../../buttons/custom_button.dart';
import '../../../util/base_utility.dart';
import '../../group/row_view.dart';
import '../../../../../screen/participant/profile/util/profile_page_utility.dart';

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
      padding: isThereButton ? const EdgeInsets.only(bottom: 5,right: 12) : const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        elevation: 5,
        shadowColor: isThereButton == true && purpose == 'seminar'
            ? AppColors.cornFlowerBlue
            : AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: isThereButton ? 114 : 80,
          width: isThereButton ? 250 : 342,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(
                  color: isThereButton == true && purpose == 'seminar'
                      ? AppColors.cornFlowerBlue
                      : Colors.grey.withOpacity(0.50),
                  width: 2)), //
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    firstRow(),
                    secondRow(),
                    isThereButton ? button() : const SizedBox()
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget secondRow() {
    return rowView(
        ProfilePageUtility.normalTextRow(
            row2Text,
            secondIconData,
            TextStyle(
                fontSize: 17,
                fontWeight:
                    purpose != 'date' ? FontWeight.bold : FontWeight.w400)),
        const EdgeInsets.only(top: 10));
  }

  Widget firstRow() {
    return rowView(
        purpose != 'date'
            ? ProfilePageUtility.normalTextRow(row1Text,firstIconData,
                const TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            : ProfilePageUtility.doubleTextRow('Danışan: ', row1Text, false),
        const EdgeInsets.only(top: 5));
  }

  Padding button() {
    return Padding(
        padding: AppPaddings.purpleButtonAtRight,
        child: Align(
          alignment: Alignment.centerRight,
          child: CustomButton(
              textColor: Colors.white,
              container: AppContainers.purpleButtonContainer(null),
              onTap: () {}, // izle ya da dosyayı oku fonksiyonu
              text: buttonText ?? ""),
        ));
  }
}
