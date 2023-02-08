import 'package:flutter/material.dart';
import 'package:terapievim/screen/login/component/drop_down_widget.dart';
import 'package:terapievim/screen/profile/component/image/custom_circle_avatar.dart';
import 'package:terapievim/components/text/custom_text.dart';
import 'package:terapievim/screen/login/component/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, this.rowmodel});
  RowModel? rowmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleavatar(),
                CustomHeading(text: "Melisa Kara"),
              ],
            ),
            Divider(
              color: AppColors.black,
              height: 5,
            ),
            messagebox(),
            sizedbox(),
            messageboxright(),
            sizedbox(),
            Padding(
              padding: const EdgeInsets.only(top: 290, left: 23),
              child: CustomTextField(
                isPhoneNumber: false,
                isBig: true,
                isPassword: false,
                isRowModel: false,
              ),
            ),
            DropDownWidget()
          ]),
        ),
      ),
    );
  }

  Row messagebox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        circleavatar(),
        CustomText(
            containerModel: customTextModel,
            isActivity: false,
            customText: "fd"),
      ],
    );
  }

  Row messageboxright() {
    return Row(
      children: [
        CustomText(
            containerModel: customTextModel,
            isActivity: false,
            customText: "fd"),
        circleavatar(),
      ],
    );
  }

  Padding circleavatar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: CustomCircleAvatar(
          imagePath: "assets/images/doctorfotosu.jpeg",
          big: false,
          shadow: true),
    );
  }

  SizedBox sizedbox() {
    return SizedBox(
      width: 10,
      height: 30,
    );
  }
}
