import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';
import 'package:terapievim/core/base/component/home/notification_from_ther_container.dart';
import 'package:terapievim/core/base/component/home/reminder.dart';
import 'package:terapievim/core/base/ui_models/card_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/home/p_coping_methods_view.dart';

import '../../../controller/participant/home/p_home_view_controller.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/view/base_view.dart';

class PHomeView extends StatelessWidget {
  const PHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PHomeViewController>(
      getController: PHomeViewController(),
      onPageBuilder: (context, PHomeViewController controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: AppPaddings.pagePadding,
                child: Column(
                  children: [
                    headingText(true, true, GroupTextUtil.terapiEvim),
                    headingText(false, false, HomeTextUtil.welcome),
                    minDetailsBox(
                        HomeTextUtil.copingMethods,
                        () => context.push(const PCopingMethodsView()),
                        context),
                    notification(DemoInformation.cardModelhome,
                        DemoInformation.home, DemoInformation.home.length),
                    const Reminder(
                        reminderType: ReminderType.activity,
                        name: "Gizem Göksu",
                        time: "10.12.13"),
                    NotificationContainer(
                      type: NotificationType.shortcallFail,
                      name: "OKB",
                      contentText: "hello ysasemin terapi vermeye geldi",
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

ListView notification(
    CardModel cardModel, List<String> explanation, int itemLength) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return NotificationFromTherContainer(
          cardModel: cardModel,
          explanation: explanation[index],
          buttonOnTap: () {},
          buttonText: HomeTextUtil.detail);
    },
    itemCount: itemLength,
  );
}

Widget minDetailsBox(
    String rowModelText, Function()? onTap, BuildContext context) {
  return SeminarMin(
    onTap: onTap,
    row: UiBaseModel.rowModel(rowModelText),
    isBorderPurple: true,
  );
}

Widget headingText(bool isHeading, bool isPadding, String heading) {
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
