import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/participant/activity/a_filter.dart';

ActivityController activityController = Get.find();

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.isPhoneNumber,
    required this.isBig,
    this.rowModel,
    required this.textController,
    required this.isPassword,
    required this.isRowModel,
    this.width,
    this.height,
  }) : super(key: key);

  final RowModel? rowModel;
  final bool isBig;
  final bool isRowModel;
  final bool isPassword;
  final bool isPhoneNumber;
  final double? width;
  final double? height;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    //sizedboxdan da
    return SizedBox(
      width: width ?? 342,
      height: height ?? 60,
      child: TextField(
        controller: textController,
        obscureText: isPassword
            ? activityController.isObsecure.value
            : activityController.yasemin.value,
        textAlign: TextAlign.start,
        // maxLines: isBig ? 100 : ,
        decoration: InputDecoration(
          contentPadding:
              isBig ? const EdgeInsets.all(20) : AppPaddings.contentPadding,
          filled: true,
          fillColor: AppColors.white,
          labelText: rowModel?.text ?? "",
          labelStyle: rowModel?.textStyle,
          suffix: isBig ? rowModel?.trailingIcon : null,
          prefixIcon: isRowModel ? rowModel?.leadingIcon : null,
          hintText: rowModel?.text2,
          hintStyle: rowModel?.textStyle2 ??
              AppTextStyles.normalTextStyle("small", false),
          prefixText: isPhoneNumber ? '+90 ' : null,
          enabledBorder: bordercolor(isBig),
          focusedBorder: bordercolor(isBig),
        ),
      ),
    );
  }
}

OutlineInputBorder bordercolor(bool isBig) {
  return OutlineInputBorder(
      borderRadius: AppBorderRadius.generalBorderRadius,
      borderSide: BorderSide(
        color: isBig ? AppColors.dustyGray : AppColors.cornFlowerBlue,
        width: 1,
      ));
}

RowModel searchModel = RowModel(
    isAlignmentBetween: true,
    text: ActivityTextUtil.searchText,
    leadingIcon: IconUtility.searchIcon,
    trailingIcon: IconButton(
      onPressed: () {
        Get.to(const FilterScreen());
      },
      icon: IconUtility.fiterIcon,
    ),
    textStyle2: AppTextStyles.heading(false),
    textStyle: AppTextStyles.groupTextStyle(true));
