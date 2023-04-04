import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/group/group_verification_controller.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../screen/therapist/group/confirmation/uploading.dart';
import '../groups_informations/my_groups_view.dart';

class LockScreenTherapist extends StatelessWidget {
  const LockScreenTherapist({super.key});

//conform edilme suresinde acilacak sayfa??
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // const MyGroups(),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          popUp(context)
        ],
      ),
    );
  }
}

Widget popUp(BuildContext context) {
  GroupVerificationController controller = Get.find();
  Widget shown = controller.isTherapistUploaded.isFalse
      ? noUpload(context)
      : conformed(context);

  Icon lockicon = controller.isTherapistUploaded.isTrue
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
            context.push(const MyGroups());
            //buradan kategori sayfasina yonlendirilecek
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
            //onaylama sayfasina gitmeli

            context.push(const TherapistUploadConfirm());
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
