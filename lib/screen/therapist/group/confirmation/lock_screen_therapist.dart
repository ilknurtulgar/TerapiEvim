import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/confirmation/uploading.dart';
import '../../../../controller/therapist_group_controller.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../groups_informations/my_groups_view.dart';

class LockScreenTherapist extends StatelessWidget {
  const LockScreenTherapist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const MyGroups(),
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
  TherapistGroupController controller = Get.find();
  Widget shown =
      controller.isTherapistUploaded.isFalse ? noUpload(context) : conformed();

  Icon lockicon =
      controller.isLockedOpen.isTrue ? IconUtility.lockopen : IconUtility.lock;
  return BackdropFilter(
    filter: Filter.blur,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [lockicon, shown]),
  );
}

Column conformed() {
  TherapistGroupController controller = Get.find();
  Widget button = controller.isLockedOpen.isTrue
      ? CustomButton(
          textColor: Colors.white,
          container: AppContainers.purpleButtonContainer(SizeUtil.normalValueWidth),
          onTap: () {
            //buradan kategori sayfasina yonlendirilecek
          },
          text: GroupTextUtil.groupPageText)
      : const SizedBox();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: SizeUtil.largeValueWidth,
        height: SizeUtil.mediumValueHeight,
        margin: AppPaddings.tLockScreenTextPadding,
        child: Text(
          GroupTextUtil.confirmationText,
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      button
    ],
  );
}

Column noUpload(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: AppPaddings.tLockScreenNoUploadPadding,
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
