import 'package:flutter/material.dart';
import 'package:terapievim/screen/activity/component/drop_down.dart';
import 'package:terapievim/screen/group/component/custom_heading.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/profile/component/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/models/row_model.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, this.rowmodel});
  RowModel? rowmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [CustomDropDown(purpose: "gender"), messagebox()],
        ),
        /*SingleChildScrollView(
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
            sizedbox(),
            CustomTextField(
              isPhoneNumber: false,
              isBig: true,
              isPassword: false,
              isRowModel: true,
              rowModel: searchModel,
            ),
            sizedbox(),
            MyWidget(),
            DropDown(),
            sizedbox(),
            messagebox(),
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
          ]),
        ),*/
      ),
    );
  }

  Row messagebox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        circleavatar(),
        const PurpleBorderWhiteInsideTextContainer(text: "fvlö")
        /* CustomText(
            containerModel: customTextModel,
            isActivity: false,
            customText: "fd"),*/
      ],
    );
  }

  Row messageboxright() {
    return Row(
      children: [
        CustomHeading(text: "text"),
        /* CustomText(
            containerModel: customTextModel,
            isActivity: false,
            customText: "fd"),*/
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
}
