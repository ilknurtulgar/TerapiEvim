import 'package:flutter/material.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../group/component/row_view.dart';
import '../../utility/profile_page_utility.dart';

class MethodAndSeminarShortInfoContainer extends StatelessWidget {
  const MethodAndSeminarShortInfoContainer({
    super.key,
    required this.row1Text,
    required this.row2Text,
    required this.buttonText,
    required this.isSecondRowMethod,
  });
  final String row1Text;
  final String row2Text;
  final String buttonText;
  final bool isSecondRowMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 15),
      child: Container(
        height: 114,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.50), width: 1)),//
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  rowView(ProfilePageUtility.normalTextRow(row1Text,Icons.person_outlined,const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)), const EdgeInsets.only(top: 5)),
                  rowView(ProfilePageUtility.normalTextRow(row2Text,isSecondRowMethod ? Icons.description_outlined : Icons.desktop_windows_outlined,const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),const EdgeInsets.only(top: 10)),
                  Padding(
                      padding: const EdgeInsets.only(left: 100, bottom: 10),
                      child: CustomButton(
                          container: AppContainers.purpleButtonContainer(null),
                          onTap: () {}, // izle ya da dosyayı oku fonksiyonu
                          text: buttonText))
                ]),
          ),
        ),
      ),
    );
  }
}
