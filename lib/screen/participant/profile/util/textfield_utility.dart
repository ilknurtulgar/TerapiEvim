import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

ActivityController activityController = Get.find();

class TextfieldUtility {
  CustomTextField nameSurnameTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          textController: textController,
          rowModel: RowModel(
            text: isBig ? 'Adınız Soyadınız' : "",
            textStyle: const TextStyle(
                color: AppColors
                    .black), // bunları öylesine verdim bunlar hint ve label textlere etki etmiyor,textfield içerisindeki labelStyle a asıl textstyle'ı verdim
            isAlignmentBetween: false,
            leadingIcon: isBig ? IconUtility.personIcon : null,
          ),
          isPhoneNumber: false,
          isBig: isBig,
          isPassword: false,
          isRowModel: false);

  CustomTextField birthOfDateTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
        textController: textController,
        rowModel: RowModel(
            text: isBig ? 'Doğum Tarihiniz' : "",
            textStyle: const TextStyle(color: AppColors.black),
            text2: 'gg/aa/yyyy',
            isAlignmentBetween: false,
            leadingIcon: IconButton(
                icon: IconUtility.calendarIcon,
                onPressed: () => choosingBirthday(textController))),
        isPhoneNumber: false,
        isBig: isBig,
        isPassword: false,
        isRowModel: true,
      );
  CustomTextField mailTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          textController: textController,
          rowModel: RowModel(
              text: isBig ? 'E Posta Adresiniz' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.emailIcon),
          isPhoneNumber: false,
          isBig: isBig,
          isPassword: false,
          isRowModel: true);

  CustomTextField passwordTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          textController: textController,
          rowModel: RowModel(
            text: isBig ? 'Şifre' : "",
            textStyle: const TextStyle(color: AppColors.black),
            isAlignmentBetween: false,
            leadingIcon: IconUtility.lock,
            trailingIcon: Obx(
              () => IconButton(
                icon: Icon(activityController.isObsecure.value
                    ? IconUtility.visibilityoffIcon.icon
                    : IconUtility.visibilityIcon.icon),
                onPressed: () => activityController.obsecureChange(),
              ),
            ),
          ),
          isPhoneNumber: false,
          isBig: isBig,
          isPassword: true,
          isRowModel: true);

  CustomTextField phoneTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          textController: textController,
          rowModel: RowModel(
              text: isBig ? 'Telefon Numaranız' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: isBig ? IconUtility.contactPhoneIcon : null),
          isPhoneNumber: true,
          isBig: isBig,
          isPassword: false,
          isRowModel: true);

  ActivityController activityController = Get.find();

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
}
