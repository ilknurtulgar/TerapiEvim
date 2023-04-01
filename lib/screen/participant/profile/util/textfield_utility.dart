import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

///TODO: TextFieldUtility should be independent from activityController
ActivityController activityController = Get.find();

class TextfieldUtility {
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
        rowModel: RowModel(
            text: isBig ? 'Doğum Tarihiniz' : "",
            textStyle: const TextStyle(color: AppColors.black),
            text2: 'gg/aa/yyyy',
            isAlignmentBetween: false,
            leadingIcon: IconButton(
                icon: IconUtility.calendarIcon,
                onPressed: () => choosingBirthday(textController))),
        isBig: isBig,
        isRowModel: true,
      );
  CustomTextField mailTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isOne: false,
          title: "Email",
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

  Widget passwordTextfield(TextEditingController textController, bool isBig) =>
      Obx(
        () => CustomTextField(
            isOne: false,
            obsecureText: activityController.isObsecure.value,
            title: "Şifreee",
            textController: textController,
            rowModel: RowModel(
              text: isBig ? 'Şifre' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.lockSmall,
              trailingIcon: IconButton(
                icon: Icon(activityController.isObsecure.value
                    ? IconUtility.visibilityoffIcon.icon
                    : IconUtility.visibilityIcon.icon),
                onPressed: () => activityController.obsecureChange(),
              ),
            ),
            isBig: isBig,
            isRowModel: true),
      );

  CustomTextField phoneTextfield(
          TextEditingController textController, bool isBig) =>
      CustomTextField(
          isOne: false,
          textController: textController,
          rowModel: RowModel(
              text: isBig ? 'Telefon Numaranız' : "",
              textStyle: const TextStyle(color: AppColors.black),
              isAlignmentBetween: false,
              leadingIcon: isBig ? IconUtility.contactPhoneIcon : null),
          prefixText: "+90",
          isBig: isBig,
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
