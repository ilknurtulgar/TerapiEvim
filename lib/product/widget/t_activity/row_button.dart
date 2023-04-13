import 'package:flutter/material.dart';

import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/ui_models/container_model.dart';
import '../../../core/base/util/base_utility.dart';

class RowButton extends StatelessWidget {
  const RowButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      required this.containerbutton});
  final String buttonText;
  final ContainerModel containerbutton;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: CustomButton(
        textColor: AppColors.white,
        container: containerbutton,
        onTap: onTap!,
        text: buttonText,
      ),
    );
  }
}
