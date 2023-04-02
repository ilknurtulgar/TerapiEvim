import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';
import 'package:terapievim/core/base/component/home/notification_from_ther_container.dart';
import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/core/base/models/card_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/home/coping_methods.dart';

import '../../../core/base/util/base_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                headingtext(true, true, GroupTextUtil.terapiEvim),
                headingtext(false, false, HomeTextUtil.welcome),
                mindetailesbox(HomeTextUtil.copingMethods,
                    () => context.push(const CopingMethods()), context),
                notification(DemoInformation.cardModelhome,
                    DemoInformation.home, DemoInformation.home.length),
                const Reminder(
                    reminderType: ReminderType.activity,
                    name: "Gizem Göksu",
                    time: "10.12.13"),
                const NotificationContainer(
                    type: NotificationType.shortcallFail,
                    name: "OKB",
                    contentText: "hello ysasemin terapi vermeye geldi")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ListView notification(
    CardModel cardmodel, List<String> explanation, int itemlenght) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return NotificationFromTherContainer(
          cardModel: cardmodel,
          explanation: explanation[index],
          buttonOnTap: () {},
          buttonText: HomeTextUtil.detail);
    },
    itemCount: itemlenght,
  );
}

Widget mindetailesbox(
    String rowmodeltext, Function()? onTap, BuildContext context) {
  return SeminarMin(
    onTap: onTap,
    row: UiBaseModel.rowModel(rowmodeltext),
    isBorderPurple: true,
  );
}

Widget headingtext(bool isHeading, bool isPadding, String heading) {
  return Padding(
      padding: isPadding ? AppPaddings.headingTopPadding : EdgeInsets.zero,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          heading,
          style: AppTextStyles.heading(isHeading),
        ),
      ));
}

Widget titleText(String title) {
  return Padding(
    padding: AppPaddings.mediumxPadding,
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTextStyles.heading(false),
      ),
    ),
  );
}
