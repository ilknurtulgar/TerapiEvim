import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/screen/therapist/home/home_utility.dart';
import '../../models/row_model.dart';
import '../../util/base_utility.dart';
import '../group/row_view.dart';

import '../../models/row_model.dart';
import '../../util/base_utility.dart';
import '../group/row_view.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer(
      {super.key,
      required this.type,
      required this.name,
      required this.contentText});
  final NotificationType type;

  final String name;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    final String notificationText = textSet(type);
    return Container(
      decoration: AppBoxDecoration.notificationDec,
      width: 342,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationConst(),
          notificationContent(notificationText, name, contentText),
          notificationButton()
        ],
      ),
    );
  }

  Padding notificationButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 150.0, bottom: 16),
      child: CustomButton(
          container: ContainerModel(
              backgroundColor: AppColors.butterflyBush,
              borderRadius: 100,
              height: 30,
              shadowColor: AppColors.butterflyBush,
              width: 175),
          onTap: () {},
          text: "Tekrar Psikolog Bul"),
    );
  }
}

Widget notificationConst() {
  return rowView(
      RowModel(
          text: HomeTextUtil.notification,
          textStyle: AppTextStyles.groupTextStyle(true),
          leadingIcon: IconUtility.notification,
          isAlignmentBetween: false),
      AppPaddings.reminderPadding);
}

Padding notificationContent(
    String reminderTypeText, String name, String contentText) {
  return Padding(
    padding: AppPaddings.reminderPadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reminderTypeText,
          style: AppTextStyles.groupTextStyle(false),
        ),
        Padding(
            padding: AppPaddings.reminderBetweenText,
            child: customText("${HomeTextUtil.therapyName} $name")),
        customText(contentText),
      ],
    ),
  );
}

Text customText(String reminderTypeText) {
  return Text(
    reminderTypeText,
    style: AppTextStyles.groupTextStyle(true),
  );
}

enum NotificationType { shortcallFail }

String textSet(NotificationType type) {
  return "Yardimci Psikolog Bulunmasi";
}
