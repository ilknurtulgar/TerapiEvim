import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/profile/settings/settings_pop_up.dart';

import '../../../../controller/therapist/settings/t_settings_controller.dart';
import '../../../../core/base/util/text_utility.dart';
import '../therapist_profile_page.dart';

// ignore: must_be_immutable
class TSettings extends StatelessWidget {
  const TSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TSettingsController>(
      getController: TSettingsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              accountRow(context),
              notificationRow(controller),
              textButton(ProfileSettingsTextUtil.deleteAccount, () {
                deleteAccount(context);
              }),
              textButton(ProfileSettingsTextUtil.signOut, () {
                signOut(context);
              }),
            ],
          ),
        )),
      ),
    );
  }

  Widget appBar() {
    return rowView(
        RowModel(
            text: ProfileSettingsTextUtil.settings,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: true),
        AppPaddings.appBarPadding);
  }

  InkWell accountRow(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(const TherapistProfilePage());
      },
      child: rowView(
          RowModel(
              text: ProfileSettingsTextUtil.myAccount,
              textStyle: AppTextStyles.aboutMeTextStyle(false),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.personIcon,
              trailingIcon: IconUtility.forward),
          AppPaddings.componentPadding),
    );
  }

  Widget notificationRow(TSettingsController controller) {
    return rowView(
        RowModel(
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
        AppPaddings.componentPadding);
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
