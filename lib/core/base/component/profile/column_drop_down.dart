import 'package:flutter/material.dart';
import 'package:terapievim/controller/auth/sign_up_controller.dart';

import '../../util/base_utility.dart';
import '../../view/base_view.dart';
import '../activtiy/drop_down.dart';

class ColumnDropDown extends StatelessWidget {
  const ColumnDropDown({
    super.key,
    required this.title,
    required this.textList,
    required this.isInProfilePage,
    required this.selectedText,
    required this.onDropDownTapped,
    required this.onValueSelected,
  });

  final String title, selectedText;
  final List<String> textList;
  final bool isInProfilePage;
  final Function() onDropDownTapped;
  final Function(int) onValueSelected;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpController>(
      getController: SignUpController(),
      onModelReady: (model) {},
      onPageBuilder: (context, SignUpController controller) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: responsivenestext(
                title,
                AppTextStyles.normalTextStyle("medium", false),
              ),
            ),
            CustomDropDown(
              selectedText: controller.genders,
              textList: DemoInformation.genderList,
              isBoxSelected: controller.isBoxSelected,
              onDropDownTapped: () {
                controller.setIsBoxSelected();
              },
              onValueSelected: (int value) {
                controller.setSelectedValue(value);
              },
              width: isInProfilePage
                  ? SizeUtil.highestValueWidth
                  : SizeUtil.generalWidth,
              height: isInProfilePage
                  ? SizeUtil.lowValueHeight
                  : SizeUtil.generalHeight,
            )
          ],
        );
      },
    );
  }
}
