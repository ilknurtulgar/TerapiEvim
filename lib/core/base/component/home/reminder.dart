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

    return InkWell(
      onTap: () {},
      child: Container(
        margin: AppPaddings.componentPadding,
        decoration: AppBoxDecoration.shadow,
        // width: Responsive.width(SizeUtil.generalWidth, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowView(UiBaseModel.rowcontainer(true, context),
                AppPaddings.miniHeadingPadding(true)),
            reminderContent(reminderTypeText)
          ],
        ),
      ),
    );
  }

  Padding reminderContent(String reminderTypeText) {
    return Padding(
      padding: AppPaddings.miniHeadingPadding(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reminderTypeText,
            style: AppTextStyles.groupTextStyle(false),
          ),
          customText(name),
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

enum ReminderType { therapy, activity }

String textSet(
  ReminderType type,
) {
  switch (type) {
    case ReminderType.activity:
      return HomeTextUtil.event;

    case ReminderType.therapy:
      return HomeTextUtil.therapyNameTwoDots;
  }
}
