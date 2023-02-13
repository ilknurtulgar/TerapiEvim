import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import 'util/text_util.dart';

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
            GroupTexts.groupOutHeading,
            style: AppTextStyles.heading(false),
          ),
          content: const Text(GroupTexts.groupOutText),
          actions: <Widget>[
            popUpButton(context, GroupTexts.iptal),
            popUpButton(context, GroupTexts.evet),
          ],
        ),
      ),
    );
  }

  TextButton popUpButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        if (text == GroupTexts.evet) {
          //degistirilecek
          //print("Iptal");
        } else {
          //print("evet");
        }
        Get.back();
      },
      child: Text(
        text,
        style: AppTextStyles.buttonTextStyle(AppColors.black),
      ),
    );
  }
}
