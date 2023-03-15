import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../core/base/util/text_utility.dart';

class GroupOut extends StatelessWidget {
  const GroupOut({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconUtility.logoutIcon,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.generalBorderRadius),
          title: Text(
            GroupTextUtil.groupOutHeading,
            style: AppTextStyles.heading(false),
          ),
          content: const Text(GroupTextUtil.groupOutText),
          actions: <Widget>[
            popUpButton(context, GroupTextUtil.cancelText),
            popUpButton(context, GroupTextUtil.yes),
          ],
        ),
      ),
    );
  }

  TextButton popUpButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        if (text == GroupTextUtil.yes) {
        } else {}
        Get.back();
      },
      child: Text(
        text,
        style: AppTextStyles.buttonTextStyle(AppColors.black),
      ),
    );
  }
}
