import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

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
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [shadow()]),
        width: 342,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reminderconst(),
            reminderContent(reminderTypeText, reminderName)
          ],
        ),
      ),
    );
  }

  BoxShadow shadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }

  Widget reminderconst() {
    return rowView(
        RowModel(
            text: "Hatirlatma",
            textStyle: AppTextStyles.groupTextStyle(true),
            leadingIcon: IconUtility.clockIcon,
            trailingIcon: const Padding(
              padding: EdgeInsets.only(left: 170.0),
              child: IconUtility.arrowForwardIcon,
            ),
            isAlignmentBetween: false),
        const EdgeInsets.symmetric(vertical: 13, horizontal: 16));
  }

  Padding reminderContent(String reminderTypeText, String reminderName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reminderTypeText,
            style: AppTextStyles.groupTextStyle(false),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: customText("$reminderName $name")),
          customText("Saat: $time"),
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
  const String shortcallText = "15 Dakikalik Seans";
  const String activityText = "Etkinlik";
  const String therapyText = "Grup Terapisi";

  switch (type) {
    case ReminderType.activity:
      return activityText;

    case ReminderType.shortcall:
      return shortcallText;

    case ReminderType.therapy:
      return therapyText;
  }
}

String nameSet(ReminderType type) {
  const String shortcallName = "Danisan: ";
  const String activityName = "Etkinlik Ismi:";
  const String therapyName = "Grup:";
  switch (type) {
    case ReminderType.activity:
      return activityName;

    case ReminderType.shortcall:
      return shortcallName;

    case ReminderType.therapy:
      return therapyName;
  }
}
