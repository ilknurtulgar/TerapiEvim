import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../util/text_utility.dart';

//terapist sayfasi hatirlatmalar
class Reminder extends StatelessWidget {
  const Reminder(
      {super.key,
      required this.reminderType,
      required this.name,
      required this.time});
  final ReminderType reminderType; //"activity","therapy","shortcall"
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    late String reminderTypeText = textSet(reminderType);
    late String reminderName = nameSet(reminderType);

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: AppBoxDecoration.shadow,
        width: 342,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reminderconst(),
            reminderContent(reminderTypeText, reminderName)
          ],
        ),
      ),
    );
  }

  Widget reminderconst() {
    return rowView(UiBaseModel.rowcontainer(true), AppPaddings.reminderPadding);
  }

  Padding reminderContent(String reminderTypeText, String reminderName) {
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
              child: customText("$reminderName $name")),
          customText("${HomeTextUtil.timeTwoDots} $time"),
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
}

enum ReminderType { shortcall, therapy, activity }

String textSet(
  ReminderType type,
) {
  switch (type) {
    case ReminderType.activity:
      return HomeTextUtil.event;

    case ReminderType.shortcall:
      return HomeTextUtil.shortCall;

    case ReminderType.therapy:
      return HomeTextUtil.therapyNameTwoDots;
  }
}

String nameSet(ReminderType type) {
  switch (type) {
    case ReminderType.activity:
      return HomeTextUtil.activityName;

    case ReminderType.shortcall:
      return HomeTextUtil.clientTwoDots;

    case ReminderType.therapy:
      return HomeTextUtil.therapyNameTwoDots;
  }
}
