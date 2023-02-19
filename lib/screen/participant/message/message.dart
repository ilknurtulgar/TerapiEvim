import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/component/login/custom_textfield.dart';
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: divider(),
            ),
            Expanded(
              child: SingleChildScrollView(child: messageexpanded(context)),
            ),
            sendbox(),
          ],
        ),
      ),
    );
  }

  Widget sendbox() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
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
    );
  }

  Column messageexpanded(BuildContext context) {
    return Column(children: [
      messagecontainer(context, true, "hadi levent gidelim"),
      messagecontainer(context, false, "ela konuşmamız gerek"),
      messagecontainer(context, true, "dinliyorum"),
      messagecontainer(context, false, "ben.."),
      messagecontainer(
          context, false, "ben bu aşka olan inancımı kaybettim ela"),
      messagecontainer(context, true, "hığ"),
      messagecontainer(context, false, "üzgünüm ela,hoşçakal"),
      messagecontainer(context, true, "fon müzik: ağla kalbim ağla sen ağlaa"),
    ]);
  }

  Divider divider() {
    return const Divider(
      color: AppColors.black,
      height: 5,
    );
  }

  Row messagecontainer(BuildContext context, bool isStart, String message) {
    return Row(
      mainAxisAlignment:
          isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        isStart
            ? circleavatar()
            : Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 5,
                ),
                child: constrainedbox(context, message),
              ),
        isStart ? constrainedbox(context, message) : circleavatar()
      ],
    );
  }

  ConstrainedBox constrainedbox(BuildContext context, String message) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 10, maxWidth: MediaQuery.of(context).size.width - 180),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.cornFlowerBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  /* Positioned demo() {
    return Positioned(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.white)),
      width: window.physicalSize.width,
      height: 162,
    ));
  }*/

  Widget messageappbar() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleavatar(),
          CustomHeading(text: "Melisa Kara", isalignmentstart: false),
        ],
      ),
    );
  }

  Widget circleavatar() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomCircleAvatar(
          imagePath: "assets/images/doctorfotosu.jpeg",
          big: false,
          shadow: false),
    );
  }
}
