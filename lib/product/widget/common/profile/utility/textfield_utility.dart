import 'package:get/get.dart';
import '../../../../../core/base/component/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../../core/base/ui_models/row_model.dart';
import '../../../../../core/base/util/base_utility.dart';

class TextFieldUtility {
  CustomTextField nameSurnameTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isOne: false,
          title: "Ad Soyad",
          textController: textController,
          rowModel: RowModel(
            text: isBig ? 'Adınız Soyadınız' : "",
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
        isOne: false,
        title: "Doğum Tarihi",
        textController: textController,
        onTap: () => choosingBirthday(textController),
        rowModel: RowModel(
            text: isBig ? 'Doğum Tarihiniz' : "",
            textStyle: const TextStyle(color: AppColors.black),
            text2: 'gg/aa/yyyy',
            isAlignmentBetween: false,
            leadingIcon: IconUtility.calendarIcon),
        isBig: isBig,
        isRowModel: true,
      );
  CustomTextField mailTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isOne: false,
          title: "E Posta",
          textController: textController,
          rowModel: RowModel(
              text2: "abcde@gmail.com",
              text: isBig ? 'E Posta Adresiniz' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.emailIcon),
          isBig: isBig,
          obsecureText: false,
          isRowModel: true);

  Widget passwordTextfield(TextEditingController textController, bool isBig) {
    var isObscured = true.obs;
    return Obx(
      () => CustomTextField(
          isOne: false,
          obsecureText: isObscured.value,
          title: "Şifre",
          maxLines: 1,
          textController: textController,
          rowModel: RowModel(
            text: isBig ? 'Şifre' : "",
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
          isOne: false,
          title: 'Telefon Numarası',
          textController: textController,
          rowModel: RowModel(
              text: isBig ? 'Telefon Numaranız' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: isBig ? IconUtility.contactPhoneIcon : null),
          prefixText: "+90",
          isBig: isBig,
          isRowModel: true);
}

Future<void> choosingBirthday(TextEditingController controller) async {
  DateTime? pickedDate = await Get.dialog(DatePickerDialog(
      initialDate: DateTime(1990),
      firstDate: DateTime(1923),
      lastDate: DateTime(2004)));
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
  }
}
