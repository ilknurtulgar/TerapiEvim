import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_utility.dart';

class PMessageView extends StatelessWidget {
  PMessageView({super.key, this.rowModel});

  final RowModel? rowModel;
  final isService = false;

  ///TODO it should be in controller
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isService ? null : MyAppBar(title: "Mesaj Gönder"),
      //   bottomNavigationBar: sendbox(),
      body: isService == false
          ? Padding(
              padding: AppPaddings.pagePadding, child: EmptySizedBoxText())
          : Column(
              children: [
                doubleappbar(context),
                divider(false),
                Expanded(
                  child: SingleChildScrollView(child: messageexpanded(context)),
                ),
              ],
            ),
    );
  }

  /* Widget sendbox() {
    return Container(
      color: AppColors.white,
      height: SizeUtil.normalValueHeight,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextField(
            isPassword: true,
            isOne: true,
            textController: textEditingController,
            isBig: false,
            isRowModel: false,
          ),
          IconButton(onPressed: () {}, icon: IconUtility.sendIcon),
        ],
      ),
    );*/
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
              padding: AppPaddings.componentPadding,
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

Widget doubleappbar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      backButton(context, () => context.pop()),
      circleavatar(),
      const CustomHeading(
          text: DemoInformation.headingabactivity, isalignmentstart: false),
    ],
  );
}

Widget circleavatar() {
  return const Padding(
    padding: AppPaddings.generalPadding,
    child: CustomCircleAvatar(
        imagePath: DemoInformation.japonkadin, big: false, shadow: false),
  );
}
