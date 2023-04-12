import 'package:flutter/material.dart';
import '../../util/base_model.dart';
import '../../util/base_utility.dart';
import '../../util/text_utility.dart';
import '../buttons/custom_button.dart';
import '../group/row_view.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer(
      {super.key,
      required this.type,
      required this.name,
      required this.contentText,
      required this.onTap});
  final Function() onTap;
  final NotificationType type;
  final String name;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    final String notificationText = textSet(type);
    return Container(
      margin: AppPaddings.componentPadding,
      decoration: AppBoxDecoration.shadow,
      width: Responsive.width(SizeUtil.generalWidth, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationConst(context),
          notificationContent(notificationText, name, contentText),
          notificationButton(onTap)
        ],
      ),
    );
  }

  Widget notificationButton(Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: AppPaddings.rowViewPadding,
          child: CustomButton(
              textColor: Colors.white,
              container: AppContainers.notificationButton,
              onTap: onTap,
              text: GroupTextUtil.findAnotherTherapist),
        ),
      ],
    );
  }
}

Widget notificationConst(BuildContext context) {
  return RowView(
      rowModel: UiBaseModel.rowcontainer(false, context),
      padding: AppPaddings.miniHeadingPadding(true));
}

Padding notificationContent(
    String reminderTypeText, String name, String contentText) {
  return Padding(
    padding: AppPaddings.miniHeadingPadding(true),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reminderTypeText,
          style: AppTextStyles.groupTextStyle(false),
        ),
        customText("${HomeTextUtil.therapyNameTwoDots} $name"),
        customText(contentText),
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

enum NotificationType { shortcallFail }

String textSet(NotificationType type) {
  return GroupTextUtil.notificationSecThe;
}
