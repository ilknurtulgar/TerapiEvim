import 'package:flutter/material.dart';

import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';

class ButterFlyButton extends StatelessWidget {
  const ButterFlyButton(
      {super.key, required this.buttonOnTap, required this.buttonName});
  final Function() buttonOnTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: AppPaddings.componentPadding,
        child: CustomButton(
            container: AppContainers.containerButton(true),
            textColor: AppColors.white,
            onTap: buttonOnTap,
            text: buttonName),
      ),
    );
  }
}
