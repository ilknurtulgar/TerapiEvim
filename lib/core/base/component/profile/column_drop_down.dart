import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/base_utility.dart';
import '../activity/drop_down.dart';

class ColumnDropDown extends StatelessWidget {
  const ColumnDropDown({
    super.key,
    required this.title,
    required this.isInProfilePage,
    required this.selectedText,
    required this.onDropDownTapped,
    required this.onValueSelected,
    required this.isLogin,
    required this.isBoxSelected,
  });

  final String title;
  final RxString selectedText;
  final bool isInProfilePage;
  final Function() onDropDownTapped;
  final Function(int) onValueSelected;
  final bool isLogin;
  final RxBool isBoxSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.centerLeft,
          child: responsivenestext(
            title,
            AppTextStyles.normalTextStyle("medium", false),
          ),
        ),
        CustomDropDown(
          alignment: Alignment.centerLeft,
          isLogin: isLogin,
          selectedText: selectedText,
          textList: DemoInformation.genderList,
          isBoxSelected: isBoxSelected,
          onDropDownTapped: onDropDownTapped,
          onValueSelected: onValueSelected,
          width: isInProfilePage
              ? SizeUtil.generalWidth
              : SizeUtil.specialValueWidth,
          height: isInProfilePage
              ? SizeUtil.lowValueHeight
              : SizeUtil.generalHeight,
        )
      ]),
    );
  }
}
