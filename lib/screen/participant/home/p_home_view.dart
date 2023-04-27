import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/core/base/component/home/notification_container.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/message/t_message_view.dart';

import '../../../controller/participant/home/p_home_view_controller.dart';
import '../../../core/base/component/activtiy/seminers.dart';
import '../../../core/base/component/home/reminder.dart';
import '../../../core/base/ui_models/card_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/empty_sizedbox_text.dart';
import 'p_coping_methods_view.dart';

class PHomeView extends StatelessWidget {
  const PHomeView({super.key});
  final isService = true;
  @override
  Widget build(BuildContext context) {
    return BaseView<PHomeViewController>(
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
                isService
                    ? notification(cardModelsx, DemoInformation.home,
                        DemoInformation.home.length)
                    : SliverToBoxAdapter(child: EmptySizedBoxText()),
                SliverToBoxAdapter(
                  child: const Reminder(
                      reminderType: ReminderType.activity,
                      name: "Gizem Tunç",
                      time: "10.12.13"),
                ),
                SliverToBoxAdapter(
                    child: NotificationContainer(
                  type: NotificationType.shortcallFail,
                  name: "Gülizar Kara",
                  contentText:
                      "Grup Terapi saatiniz geldi .Terapiye katılabilirsiniz",
                  onTap: () {
                    flutterErrorToast("Yardımıc terapist bulunmamaktadır.");
                  },
                )),
                SliverToBoxAdapter(
                  child: const Reminder(
                      reminderType: ReminderType.therapy,
                      name: "Cüneyt Ata",
                      time: "10.12.23"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

SliverList notification(
    List<CardModel> cardModel, List<String> explanation, int itemLength) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return HomeComponent(
          isForMethodReading: false,
          cardModel: cardModel[index],
          explanation: explanation[index],
          buttonOnTap: () {},
          buttonText: HomeTextUtil.detail);
    }, childCount: 2),
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
