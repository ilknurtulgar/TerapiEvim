import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terapievim/core/base/component/buttons/custom_button.dart';
import 'package:terapievim/core/base/models/container_model.dart';

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
    final String NotificationText = textSet(type);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [shadow()]),
      width: 342,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notificationConst(),
          notificationContent(NotificationText, name, contentText),
          Padding(
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
          )
        ],
      ),
    );
  }
}

BoxShadow shadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    blurRadius: 7,
    offset: const Offset(0, 3), // changes position of shadow
  );
}

Padding notificationContent(
    String reminderTypeText, String name, String contentText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reminderTypeText,
          style: AppTextStyles.groupTextStyle(false),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: customText("Grup: $name")),
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

Widget notificationConst() {
  return rowView(
      RowModel(
          text: "Bildirim",
          textStyle: AppTextStyles.groupTextStyle(true),
          leadingIcon: IconUtility.clockIcon,
          isAlignmentBetween: false),
      const EdgeInsets.symmetric(vertical: 16, horizontal: 16));
}

String textSet(NotificationTypetype) {
  return "Yardimci Psikolog Bulunmasi";
}
