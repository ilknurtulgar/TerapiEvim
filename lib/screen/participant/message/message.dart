import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/purple_border_text_ccontainer.dart';
import 'package:terapievim/core/base/component/profile/image/custom_circle_avatar.dart';
import 'package:terapievim/core/base/models/row_model.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, this.rowmodel});
  final RowModel? rowmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [const CustomDropDown(purpose: "gender"), messagebox()],
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
        CustomHeading(isalignmentstart: true, text: "text"),
        /* CustomText(
            containerModel: customTextModel,
            isActivity: false,
            customText: "fd"),*/
        circleavatar(),
      ],
    );
  }

  Padding circleavatar() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: CustomCircleAvatar(
          imagePath: "assets/images/doctorfotosu.jpeg",
          big: false,
          shadow: true),
    );
  }
}
