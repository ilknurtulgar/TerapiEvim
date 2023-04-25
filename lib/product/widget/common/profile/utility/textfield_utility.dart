import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../../core/base/component/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../../core/base/ui_models/row_model.dart';
import '../../../../../core/base/util/base_utility.dart';

class TextFieldUtility {
  CustomTextField nameSurnameTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isPassword: true,
          isOne: false,
          title: "Ad Soyad",
          textController: textController,
          rowModel: RowModel(
            text: "",
            textStyle: const TextStyle(
                color: AppColors
                    .black), // bunları öylesine verdim bunlar hint ve label textlere etki etmiyor,textfield içerisindeki labelStyle a asıl textstyle'ı verdim
            isAlignmentBetween: false,
            leadingIcon: isBig ? IconUtility.personIcon : null,
          ),
          isBig: isBig,
          isRowModel: false);

  CustomTextField birthOfDateTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
        isPassword: true,
        isOne: false,
        title: "Doğum Tarihi",
        textController: textController,
        onTap: () => choosingDate(textController, true),
        rowModel: RowModel(
            text: 'gg/aa/yyyy ',
            textStyle: const TextStyle(color: AppColors.black),
            isAlignmentBetween: false,
            leadingIcon: IconUtility.calendarIcon),
        isBig: isBig,
        isRowModel: true,
      );
  CustomTextField mailTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isPassword: true,
          isOne: false,
          title: "E Posta",
          textController: textController,
          rowModel: RowModel(
              text: "abcde@gmail.com",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.emailIcon),
          isBig: isBig,
          obsecureText: false,
          isRowModel: true,keyboardType: TextInputType.emailAddress);

  Widget passwordTextfield(TextEditingController textController, bool isBig) {
    var isObscured = true.obs;
    return Obx(
      () => CustomTextField(
          isPassword: true,
          isOne: false,
          obsecureText: isObscured.value,
          title: "Şifre",
          textController: textController,
          rowModel: RowModel(
            text: "",
            textStyle: const TextStyle(color: AppColors.black),
            isAlignmentBetween: false,
            leadingIcon: IconUtility.lockSmall,
            trailingIcon: IconButton(
                icon: Obx(
                  () => Icon(
                    isObscured.value
                        ? IconUtility.visibilityoffIcon.icon
                        : IconUtility.visibilityIcon.icon,
                    color: AppColors.black,
                  ),
                ),
                onPressed: () {
                  isObscured.value = !isObscured.value;
                }),
          ),
          isBig: isBig,
          isRowModel: true),
    );
  }

  CustomTextField phoneTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isPassword: true,
          isOne: false,
          title: 'Telefon Numarası',
          textController: textController,
          rowModel: RowModel(
              text: "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: isBig ? IconUtility.contactPhoneIcon : null),
          prefixText: "+90",
          isBig: isBig,
          isRowModel: true);
}

Future<void> choosingDate(TextEditingController controller, bool isForBirthday,
    [Timestamp? timeStamp,]) async {
  DateTime? pickedDate = await Get.dialog(DatePickerDialog(
      initialDate: DateTime(1990),
      firstDate: DateTime(1923),
      lastDate: DateTime(isForBirthday ? 2004 : 2050)));
  String? day;
  String? month;
  String? year;
  if (pickedDate != null) {
    day = pickedDate.day.toInt() < 10
        ? '0${pickedDate.day.toString()}'
        : pickedDate.day.toString();
    month = pickedDate.month.toInt() < 10
        ? '0${pickedDate.month.toString()}'
        : pickedDate.month.toString();
    year = pickedDate.year.toString();
    controller.text = '$day/$month/$year';
    if (timeStamp != null) {
      timeStamp = Timestamp.fromDate(pickedDate);
      //print(Timestamp.fromDate(pickedDate));
    }
  }
}
