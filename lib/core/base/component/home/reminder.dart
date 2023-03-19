import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../models/row_model.dart';
import '../../util/text_utility.dart';

class Reminder extends StatelessWidget {
  ///terapist sayfasi hatirlatmalar
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

    return Padding(
      padding: AppPaddings.componentPadding,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: AppBoxDecoration.shadow,
          width: SizeUtil.generalWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reminderconst(),
              reminderContent(reminderTypeText, reminderName)
            ],
          ),
        ),
      ),);
  }

  Widget reminderconst() {
    const trailing = Padding(
      padding: EdgeInsets.only(left: 170.0),
      child: IconUtility.forward,
    );
    return rowView(
        RowModel(
            text: HomeTextUtil.reminder,
            textStyle: AppTextStyles.groupTextStyle(true),
            leadingIcon: IconUtility.notification,
            trailingIcon: trailing,
            isAlignmentBetween: false),
        AppPaddings.reminderPadding);
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
