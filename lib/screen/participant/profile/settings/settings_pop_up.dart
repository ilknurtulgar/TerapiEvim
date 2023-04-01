import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';

deleteAccount(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.generalBorderRadius),
      content: const Text("Hesabi silmek istediginize emin misiniz?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            GroupTextUtil.cancelText,
            style: AppTextStyles.buttonTextStyle(AppColors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            //burada gruptan cikmasi lazim
            Get.back();
          },
          child: Text(
            GroupTextUtil.yes,
            style: AppTextStyles.buttonTextStyle(AppColors.black),
          ),
        ),
      ],
    ),
  );
}

signOut(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.generalBorderRadius),
      content: const Text("Oturumu kapatmak istediginize emin misini?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            GroupTextUtil.cancelText,
            style: AppTextStyles.buttonTextStyle(AppColors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            //burada gruptan cikmasi lazim
            Get.back();
          },
          child: Text(
            GroupTextUtil.yes,
            style: AppTextStyles.buttonTextStyle(AppColors.black),
          ),
        ),
      ],
    ),
  );
}

groupOut(BuildContext context) {
  return showDialog<String>(
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
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  GroupTextUtil.cancelText,
                  style: AppTextStyles.buttonTextStyle(AppColors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  //burada gruptan cikmasi lazim
                  Get.back();
                },
                child: Text(
                  GroupTextUtil.yes,
                  style: AppTextStyles.buttonTextStyle(AppColors.black),
                ),
              ),
            ],
          ));
}
