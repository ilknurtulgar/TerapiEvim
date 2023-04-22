import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/group/t_lock_screen_controller.dart';
import 'package:terapievim/core/base/view/base_view.dart';

import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import 't_uploading_view.dart';
import '../t_my_groups_view.dart';

class TLockView extends StatelessWidget {
  const TLockView({super.key});

//conform edilme suresinde acilacak sayfa??
  @override
  Widget build(BuildContext context) {
    return BaseView<TLockScreenController>(
      getController: TLockScreenController(),
      onPageBuilder: (context, controller) => Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // const MyGroups(),
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            popUp(context, controller)
          ],
        ),
      ),
    );
  }
}

Widget popUp(BuildContext context, TLockScreenController controller) {
  Widget shown = controller.isUploaded.isFalse
      ? noUpload(context)
      : controller.isConfirmed.isTrue
          ? conformed(context)
          : unconfermed();

  Icon lockicon = controller.isConfirmed.isTrue
      ? IconUtility.lockopen
      : IconUtility.lock(true);
  return BackdropFilter(
    filter: Filter.blur,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [lockicon, shown]),
  );
}

Column unconfermed() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockedTextContainer(GroupTextUtil.tlockScreenUnconformed),
    ],
  );
}

Column conformed(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: SizeUtil.largeValueWidth,
        height: SizeUtil.mediumValueHeight,
        margin: AppPaddings.loginTitlePadding,
        child: Text(
          GroupTextUtil.confirmationText,
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      CustomButton(
          text: GroupTextUtil.groupPageText,
          textColor: Colors.white,
          container:
              AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
          onTap: () {
            context.pushAndRemoveUntil(const TMyGroupsView());
          }),
    ],
  );
}

Column noUpload(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: AppPaddings.loginTitlePadding,
        width: SizeUtil.largeValueWidth,
        height: SizeUtil.mediumValueHeight,
        child: Text(
          GroupTextUtil.lockScreenWarningText,
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      GestureDetector(
          onTap: () {
            context.push(const TUploadConfirmView());
          },
          child: Container(
            width: SizeUtil.largeValueWidth,
            height: SizeUtil.smallValueHeight,
            decoration: AppBoxDecoration.lockScreenButton,
            child: Center(
              child: Text(GroupTextUtil.confirmText,
                  style: AppTextStyles.buttonTextStyle(AppColors.white)),
            ),
          ))
    ],
  );
}

Widget lockedTextContainer(String text) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: SizeUtil.smallValueHeight),
      width: SizeUtil.largeValueWidth,
      height: SizeUtil.mediumValueHeight,
      color: AppColors.transparent,
      child: Text(
        text,
        style: AppTextStyles.heading(false).copyWith(
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ));
}
