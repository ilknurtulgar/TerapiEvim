import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

import '../../util/text_utility.dart';

// ignore: must_be_immutable
class ToggleQuestions extends StatelessWidget {
  ToggleQuestions(
      {super.key,
      required this.question,
      required this.onPressed,
      required this.isSelected,
      required this.children});
  final String question;
  final Function(int?) onPressed;
  final List<bool> isSelected;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.componentPadding,
      padding: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.purpleBorder,
      child: Column(children: [
        CustomHeading(
          padding: AppPaddings.rowViewPadding,
          isalignmentstart: false,
          isToggle: true,
          text: question,
        ),
        SelectToggle(
            onPressed: onPressed, isSelected: isSelected, children: children),
        rowtoggletext()
      ]),
    );
  }

  Row rowtoggletext() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: responsivenestext(
            GroupTextUtil.none, AppTextStyles.normalTextStyle("medium", false)),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: responsivenestext(GroupTextUtil.veryLittle,
            AppTextStyles.normalTextStyle("medium", false)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: responsivenestext(GroupTextUtil.medium,
            AppTextStyles.normalTextStyle("medium", false)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: responsivenestext(
            GroupTextUtil.more, AppTextStyles.normalTextStyle("medium", false)),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: responsivenestext(GroupTextUtil.extreme,
            AppTextStyles.normalTextStyle("medium", false)),
      ),
    ]);
  }
}

class SelectToggle extends StatelessWidget {
  const SelectToggle({
    super.key,
    required this.onPressed,
    required this.isSelected,
    required this.children,
  });

  final Function(int?) onPressed;
  final List<bool> isSelected;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: onPressed,
      borderRadius: AppBorderRadius.generalBorderRadius,
      borderColor: BorderColorUtil.toggleBorderColor,
      selectedBorderColor: BorderColorUtil.toggleBorderColor,
      fillColor: AppColors.transparent,
      selectedColor: AppColors.cornFlowerBlue,
      splashColor: AppColors.transparent,
      constraints: const BoxConstraints(minHeight: 3, minWidth: 3),
      borderWidth: 20,
      isSelected: isSelected,
      children: children,
    );
  }
}
