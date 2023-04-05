import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../util/base_model.dart';
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

    return InkWell(
      onTap: () {},
      child: Container(
        margin: AppPaddings.componentPadding,
        decoration: AppBoxDecoration.shadow,
        width: Responsive.width(SizeUtil.generalWidth, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowView(UiBaseModel.rowcontainer(true),
                AppPaddings.miniHeadingPadding(true)),
            reminderContent(reminderTypeText, reminderName)
          ],
        ),
      ),
    );
  }

  Padding reminderContent(String reminderTypeText, String reminderName) {
    return Padding(
      padding: AppPaddings.miniHeadingPadding(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reminderTypeText,
            style: AppTextStyles.groupTextStyle(false),
          ),
          customText("$reminderName $name"),
          customText("${HomeTextUtil.timeTwoDots} $time"),
        ],
      ),
    );
  }

  Widget customText(String reminderTypeText) {
    return Padding(
      padding: AppPaddings.miniTopPadding,
      child: Text(
        reminderTypeText,
        style: AppTextStyles.groupTextStyle(true),
      ),
    );
  }
}

enum ReminderType { shortCall, therapy, activity }

String textSet(
  ReminderType type,
) {
  switch (type) {
    case ReminderType.activity:
      return HomeTextUtil.event;

    case ReminderType.shortCall:
      return HomeTextUtil.shortCall;

    case ReminderType.therapy:
      return HomeTextUtil.therapyNameTwoDots;
  }
}

String nameSet(ReminderType type) {
  switch (type) {
    case ReminderType.activity:
      return HomeTextUtil.activityName;

    case ReminderType.shortCall:
      return HomeTextUtil.clientTwoDots;

    case ReminderType.therapy:
      return HomeTextUtil.therapyNameTwoDots;
  }
}
