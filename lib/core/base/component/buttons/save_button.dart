import 'package:flutter/material.dart';

import '../../util/base_utility.dart';
import '../../util/text_utility.dart';
import 'custom_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, required this.onSaved}) : super(key: key);
  final Function() onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.pagePadding,
      child: CustomButton(
          textColor: AppColors.white,
          container:
              AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
          onTap: onSaved,
          text: ProfileSettingsTextUtil.save),
    );
  }
}
