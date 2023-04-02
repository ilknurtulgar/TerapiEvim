import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/settings/p_setting_controller.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/profile/profile_setting_page.dart';
import 'package:terapievim/screen/participant/profile/settings/settings_pop_up.dart';

// ignore: must_be_immutable
class PSettings extends StatelessWidget {
  PSettings({super.key});
  PSettingsController controller = Get.put(PSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            accountRow(context),
            notificationRow(),
            textButton("Gruptan Cik", () {
              groupOut(context);
            }),
            textButton("Hesabimi Sil", () {
              deleteAccount(context);
            }),
            textButton("Oturumu Kapat", () {
              signOut(context);
            }),
          ],
        ),
      )),
    );
  }

  Widget appBar() {
    return rowView(
        RowModel(
            text: "Ayarlar",
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: true),
        AppPaddings.appBarPadding);
  }

  InkWell accountRow(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(ParticipantProfileSettingPage());
      },
      child: rowView(
          RowModel(
              text: "Hesabim",
              textStyle: AppTextStyles.aboutMeTextStyle(false),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.personIcon,
              trailingIcon: IconUtility.forward),
          AppPaddings.componentPadding),
    );
  }

  Widget notificationRow() {
    return rowView(
        RowModel(
            isAlignmentBetween: false,
            text: "Bildirimler",
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
