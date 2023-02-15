import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/screen/therapist/message/companent/chat_information.dart';

import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_utility.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key, this.rowmodel});
  final RowModel? rowmodel;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            messageappbar(),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
                const ChatInformation(),
                CustomTextField(
                  isPhoneNumber: false,
                  isBig: false,
                  textController: textEditingController,
                  isPassword: false,
                  isRowModel: true,
                  rowModel: RowModel(
                    text: "",
                    textStyle: const TextStyle(color: AppColors.black),
                    isAlignmentBetween: false,
                  ),
                ),
                /*  messagebox(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),
                messageboxright(),
                messagebox(),
                messageboxright(),*/
              ])),
            ),
            Container(
              decoration: AppBoxDecoration.sendDecoration,
              height: 65,
              width: window.physicalSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                    textController: textEditingController,
                    isPhoneNumber: false,
                    isBig: false,
                    isPassword: false,
                    isRowModel: false,
                  ),
                  IconButton(onPressed: () {}, icon: IconUtility.sendIcon),
                ],
              ),
            ),
            //demo(),
          ],
        ),
      ),
    );
  }

  Positioned demo() {
    return Positioned(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.white)),
      width: window.physicalSize.width,
      height: 162,
    ));
  }

  Widget messageappbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        circleavatar(),
        CustomHeading(text: "Melisa Kara", isalignmentstart: false),
        const Divider(
          color: AppColors.black,
          height: 7,
        ),
      ],
    );
  }

  Widget messagebox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        circleavatar(),
      ],
    );
  }

  Row messageboxright() {
    return Row(
      children: [
        CustomHeading(isalignmentstart: true, text: "text"),
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

RowModel rowModel = RowModel(
    text: "jvv", textStyle: const TextStyle(), isAlignmentBetween: false);
