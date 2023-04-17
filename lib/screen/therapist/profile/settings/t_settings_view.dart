import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/settings/t_settings_controller.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../participant/profile/settings/p_settings_pop_up.dart';
import '../profile_settings/t_profile_settings_view.dart';

class TSettingsView extends StatelessWidget {
  const TSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TSettingsController>(
      getController: TSettingsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(
          title: ProfileSettingsTextUtil.settings,
        ),
        body: SafeArea(
            child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

  InkWell accountRow(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(TProfileSettingsView());
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

  Widget notificationRow(TSettingsController controller) {
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
