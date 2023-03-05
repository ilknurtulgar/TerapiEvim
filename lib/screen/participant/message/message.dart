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
      bottomNavigationBar: sendbox(),
      body: SafeArea(
        child: Column(
          children: [
            messageappbar(),
            Padding(
              padding: AppPaddings.dividerPadding,
              child: divider(false),
            ),
            Expanded(
              child: SingleChildScrollView(child: messageexpanded(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget sendbox() {
    return Container(
      color: Colors.white,
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
    );
  }

  Column messageexpanded(BuildContext context) {
    return Column(children: [
      messagecontainer(context, true, DemoInformation.message),
      messagecontainer(context, false, DemoInformation.message),
      messagecontainer(context, true, DemoInformation.message),
      messagecontainer(context, false, DemoInformation.message)
    ]);
  }

  Row messagecontainer(BuildContext context, bool isStart, String message) {
    return Row(
      mainAxisAlignment:
          isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        isStart
            ? circleavatar()
            : Padding(
                padding: AppPaddings.circleAvatarPadding,
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
        shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.generalBorderRadius),
        color: AppColors.cornFlowerBlue,
        child: Padding(
          padding: AppPaddings.generalPadding,
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget messageappbar() {
    return Padding(
      padding: AppPaddings.appbarLeftPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleavatar(),
          CustomHeading(
              text: DemoInformation.headingabactivity, isalignmentstart: false),
        ],
      ),
    );
  }

  Widget circleavatar() {
    return const Padding(
      padding: AppPaddings.generalPadding,
      child: CustomCircleAvatar(
          imagePath: DemoInformation.japonkadin, big: false, shadow: false),
    );
  }
}
