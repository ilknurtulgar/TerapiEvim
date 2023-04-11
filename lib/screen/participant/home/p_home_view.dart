import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/seminers.dart';
import 'package:terapievim/core/base/component/home/notification_from_ther_container.dart';
import 'package:terapievim/core/base/ui_models/card_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../../../core/base/util/base_model.dart';
import '../group/scl90/p_test_for_users_view.dart';

class PHomeView extends StatelessWidget {
  const PHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PTestView();
    /* return BaseView<PHomeViewController>(
      getController: PHomeViewController(),
      onPageBuilder: (context, PHomeViewController controller) {
        return Scaffold(
          body: Padding(
            padding: AppPaddings.pagePadding,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: headingText(true, true, GroupTextUtil.terapiEvim)),
                SliverToBoxAdapter(
                    child: headingText(false, false, HomeTextUtil.welcome)),
                SliverToBoxAdapter(
                  child: minDetailsBox(HomeTextUtil.copingMethods,
                      () => context.push(const PCopingMethodsView()), context),
                ),
                notification(DemoInformation.cardModelhome,
                    DemoInformation.home, DemoInformation.home.length),
                SliverToBoxAdapter(
                  child: const Reminder(
                      reminderType: ReminderType.activity,
                      name: "Gizem Göksu",
                      time: "10.12.13"),
                ),
              ],
            ),
          ),
        );
      },
    );*/
  }
}

SliverList notification(
    CardModel cardModel, List<String> explanation, int itemLength) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return NotificationFromTherContainer(
          cardModel: cardModel,
          explanation: explanation[index],
          buttonOnTap: () {},
          buttonText: HomeTextUtil.detail);
    }, childCount: 5),
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
