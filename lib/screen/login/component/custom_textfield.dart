import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/activity/a_filter.dart';
import 'package:terapievim/controller/activity_controller.dart';

ActivityController activityController = Get.put(ActivityController());

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.isPhoneNumber,
      required this.isBig,
      this.rowModel,
      required this.isPassword,
      required this.isRowModel,
      required this.textController})
      : super(key: key);

  RowModel? rowModel;
  bool isBig;
  bool isRowModel;
  bool isPassword;
  bool isPhoneNumber;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 20),
        child: SizedBox(
          width: isBig ? 342 : 195,
          height: isBig ? 56 : 24,
          child: Obx(
            () => TextField(
              controller: textController,
              obscureText: isPassword
                  ? activityController.isObsecure.value
                  : activityController.yasemin.value,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: rowModel?.text ?? "",
                labelStyle: rowModel?.textStyle,
                suffix: isPassword ? rowModel?.trailingIcon : null,
                prefixIcon: isRowModel ? rowModel?.leadingIcon : null,
                hintText: rowModel?.text2,
                hintStyle: rowModel?.textStyle2 ?? const TextStyle(),
                prefixText: isPhoneNumber ? '+90 ' : null,
                enabledBorder: bordercolor(isBig),
                focusedBorder: bordercolor(isBig),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ));
  }

  OutlineInputBorder bordercolor(bool isBig) {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: isBig ? AppColors.dustyGray : AppColors.cornFlowerBlue,
      width: 1,
    ));
  }
}

RowModel trailingModel = RowModel(
    isAlignmentBetween: true,
    text: "cx",
    trailingIcon: Obx(
      () => IconButton(
          onPressed: () {
            activityController.obsecureChange();
          },
          icon: activityController.isObsecure.value
              ? IconUtility.visibilityIcon
              : IconUtility.visibilityoffIcon),
    ),
    textStyle: const TextStyle());

RowModel leadingModel = RowModel(
    isAlignmentBetween: true,
    text: "adsoyad",
    //leadingIcon: IconUtility.emailIcon,
    textStyle: const TextStyle());

RowModel emailModel = RowModel(
    isAlignmentBetween: true,
    text: "email",
    leadingIcon: IconUtility.emailIcon,
    textStyle: const TextStyle());

RowModel phoneModel = RowModel(
    isAlignmentBetween: true,
    text: "phone",
    leadingIcon: IconUtility.calendarIcon,
    textStyle: const TextStyle());

RowModel searchModel = RowModel(
    isAlignmentBetween: true,
    text: "Ne aramistiniz?",
    leadingIcon: IconUtility.searchIcon,
    trailingIcon: IconButton(
      onPressed: () {
        Get.to(const FilterScreen());
      },
      icon: IconUtility.fiterIcon,
    ),
    textStyle2: AppTextStyles.heading(false),
    textStyle: AppTextStyles.groupTextStyle(true));

RowModel rowiModel = RowModel(
    text: "Baş etme metotlari",
    textStyle: const TextStyle(),
    isAlignmentBetween: true,
    trailingIcon: const Icon(Icons.keyboard_arrow_right_outlined));
