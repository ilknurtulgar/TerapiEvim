import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/settings/p_setting_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/profile/settings/p_settings_pop_up.dart';

import '../p_profile_settings_view.dart';

// ignore: must_be_immutable
class PSettingsView extends StatelessWidget {
  const PSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PSettingsController>(
      getController: PSettingsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ProfileSettingsTextUtil.settings),
        body: SafeArea(
            child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accountRow(context),
              notificationRow(controller),
              textButton(ProfileSettingsTextUtil.exitGroup, () {
                groupOut(context);
              }),
              textButton(ProfileSettingsTextUtil.deleteAccount, () {
                deleteAccount(context);
              }),
              textButton(ProfileSettingsTextUtil.signOut, () {
                signOut(context, () {
                  controller.onSignOut(context);
                });
              }),
            ],
          ),
        )),
      ),
    );
  }

  InkWell accountRow(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(PProfileSettingsView());
      },
      child: RowView(
          rowModel: RowModel(
              text: ProfileSettingsTextUtil.myAccount,
              textStyle: AppTextStyles.aboutMeTextStyle(false),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.personIcon,
              trailingIcon: IconUtility.forward),
          padding: AppPaddings.componentPadding),
    );
  }

  Widget notificationRow(PSettingsController controller) {
    return RowView(
        rowModel: RowModel(
            isAlignmentBetween: false,
            text: ProfileSettingsTextUtil.notifications,
            textStyle: AppTextStyles.aboutMeTextStyle(false),
            leadingIcon: IconUtility.notification,
            trailingIcon: Obx(
              () => CupertinoSwitch(
                  activeColor: AppColors.white,
                  trackColor: AppColors.white,
                  thumbColor: AppColors.butterflyBush,
                  value: controller.notificationButton.value,
                  onChanged: (value) {
                    controller.changeNotificationButton(value);
                  }),
            )),
        padding: AppPaddings.componentPadding);
  }

  Padding textButton(String text, Function func) {
    return Padding(
      padding: AppPaddings.miniTopPadding,
      child: TextButton(
          onPressed: () => func(),
          child: Text(
            text,
            textAlign: TextAlign.end,
            style: AppTextStyles.methodsPageTextStyle(false, false, true, true),
          )),
    );
  }
}
