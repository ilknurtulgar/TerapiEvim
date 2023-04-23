import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../screen/therapist/home/session/choosing_category_view.dart';
import '../../util/base_utility.dart';

// ignore: must_be_immutable
class ChoosingCategoryForParticipant extends StatelessWidget {
  ChoosingCategoryForParticipant(
      {super.key,
      required this.isWithIconButton,
      this.onPressed,
      required this.callBack});
  bool isWithIconButton;
  Function()? onPressed;
  Function callBack;

  RxList<bool> isSelected = RxList.filled(groups.length, false);
  late List<Widget> children =
      List.generate(groups.length, (index) => iconButtonWithText(index));

  String chosenCategory = '';

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ToggleButtons(
        onPressed: (index) {
          for (int i = 0; i < groups.length; i++) {
            isSelected[i] = i == index;
            if (isSelected[i]) chosenCategory = groups[i];
          }
          callBack(chosenCategory);
          onPressed != null ? onPressed!() : () {};
        },
        direction: Axis.vertical,
        color: AppColors.black,
        borderColor: AppColors.transparent,
        selectedBorderColor: AppColors.transparent,
        fillColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        children: children,
        isSelected: isSelected,
      ),
    );
  }

  Widget iconButtonWithText(int index) {
    return Row(
      children: [
        isWithIconButton
            ? Padding(
                padding: AppPaddings.componentOnlyPadding(4),
                child: Obx(() => isSelected[index]
                    ? IconUtility.filledCircle
                    : IconUtility.circleIcon),
              )
            : const SizedBox(),
        Padding(
          padding: AppPaddings.componentOnlyPadding(4),
          child: Text(
            groups[index],
            style: AppTextStyles.normalTextStyle('medium', false),
          ),
        ),
      ],
    );
  }
}
