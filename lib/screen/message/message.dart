import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:terapievim/components/text/custom_text.dart';
import 'package:terapievim/components/text/custom_textfield.dart';
import 'package:terapievim/components/text/drop_down.dart';
import 'package:terapievim/components/text/drop_down_widget.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/models/container_model.dart';
import 'package:terapievim/models/row_model.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, this.rowmodel});
  RowModel? rowmodel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        /*    SizedBox(
          width: 10,
          height: 30,
        ),
          CustomTextField(
          isRowModel: true,
          isWidth: true,
          isColor: true,
          isHeight: true,
          labelText: "oke ",
          hintText: "fvöf",
          isPhoneNumber: false,
          rowModel: trailingModel,
          isPassword: true,
        ),
        sizedbox(),
        CustomTextField(
          isPassword: false,
          isRowModel: false,
          isColor: false,
          isPhoneNumber: false,
          isWidth: false,
          isHeight: false,
        ),
        sizedbox(),
        CustomTextField(
          isWidth: true,
          isColor: true,
          isHeight: true,
          isPhoneNumber: false,
          isPassword: false,
          isRowModel: true,
          labelText: "döc",
          hintText: "eföç",
          rowModel: leadingModel,
        ),
        CustomTextField(
          isPhoneNumber: false,
          isWidth: true,
          isColor: true,
          isHeight: true,
          isPassword: false,
          isRowModel: true,
          labelText: "döc",
          hintText: "eföç",
          rowModel: emailModel,
        ),
        CustomTextField(
          isWidth: true,
          isColor: true,
          isHeight: true,
          isPassword: false,
          isRowModel: true,
          labelText: "döc",
          hintText: "eföç",
          isPhoneNumber: true,
          rowModel: phoneModel,
        ),
        CustomText(containerModel: customTextModel, customText: "löc"),
        sizedbox(),
        DropDownWidget()*/
        sizedbox(),
        Text(
          "BAŞ ETME METOTLARI",
          style: AppTextStyles.heading(false),
        )
      ]),
    );
  }

  SizedBox sizedbox() {
    return SizedBox(
      width: 10,
      height: 30,
    );
  }
}
