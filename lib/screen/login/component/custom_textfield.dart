import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/activity/a_filter.dart';
import 'package:terapievim/controller/activity_controller.dart';

ActivityController activityController = Get.put(ActivityController());

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.isPhoneNumber,
      this.labelText,
      this.hintText,
      required this.isWidth,
      required this.isColor,
      required this.isHeight,
      this.rowModel,
      required this.isPassword,
      required this.isRowModel})
      : super(key: key);
  String? labelText;
  String? hintText;
  RowModel? rowModel;
  bool isWidth;
  bool isHeight;
  bool isColor;
  bool isRowModel;
  bool isPassword;
  bool isPhoneNumber;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // bool isObsecure = false;
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Container(
          color: AppColors.white,
          width: widget.isWidth ? 342 : 195,
          height: widget.isHeight ? 56 : 24,
          child: Obx(
            () => TextField(
              obscureText: widget.isPassword
                  ? activityController.isObsecure.value
                  : activityController.yasemin.value,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                labelText: widget.labelText,
                suffix:
                    widget.isPassword ? widget.rowModel?.trailingIcon : null,
                prefixIcon:
                    widget.isRowModel ? widget.rowModel?.leadingIcon : null,
                hintText: widget.rowModel?.text ?? "",
                prefixText: widget.isPhoneNumber ? '+90 ' : null,
                enabledBorder: Bordercolor(widget.isColor),
                focusedBorder: Bordercolor(widget.isColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ));
  }

  OutlineInputBorder Bordercolor(bool isColor) {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: isColor ? AppColors.dustyGray : AppColors.cornFlowerBlue,
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
            print("fdclö");
            activityController.obsecureChange();
          },
          icon: activityController.isObsecure.value
              ? IconUtility.visibilityIcon
              : IconUtility.visibilityoffIcon),
    ),
    textStyle: TextStyle());

RowModel leadingModel = RowModel(
    isAlignmentBetween: true,
    text: "adsoyad",
    //leadingIcon: IconUtility.emailIcon,
    textStyle: TextStyle());

RowModel emailModel = RowModel(
    isAlignmentBetween: true,
    text: "email",
    leadingIcon: IconUtility.emailIcon,
    textStyle: TextStyle());

RowModel phoneModel = RowModel(
    isAlignmentBetween: true,
    text: "phone",
    leadingIcon: IconUtility.calendarIcon,
    textStyle: TextStyle());

RowModel searchModel = RowModel(
    isAlignmentBetween: true,
    text: "Ne aramistiniz?",
    leadingIcon: IconUtility.searchIcon,
    trailingIcon: IconButton(
      onPressed: () {
        print("tik");
        Get.to(const FilterScreen());
      },
      icon: IconUtility.fiterIcon,
    ),
    textStyle: TextStyle());

RowModel rowiModel = RowModel(
    text: "Baş etme metotlari",
    textStyle: TextStyle(),
    isAlignmentBetween: true,
    trailingIcon: Icon(Icons.keyboard_arrow_right_outlined));
