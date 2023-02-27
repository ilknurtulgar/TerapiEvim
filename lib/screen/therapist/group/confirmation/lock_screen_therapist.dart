import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/therapist_group_controller.dart';
import '../../../../core/base/component/buttons/custom_button.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../participant/group/util/lock_screen_utility.dart';
import '../groups_informations/my_groups_view.dart';

class LockScreenTherapist extends StatelessWidget {
  const LockScreenTherapist({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        MyGroups(),
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        popUp()
      ],
    );
  }
}

Widget popUp() {
  TherapistGroupController controller = Get.put(TherapistGroupController());
  Widget shown =
      controller.isTherapistUploaded.isFalse ? noUpload() : conformed();

  IconData lockicon =
      controller.isLockedOpen.isTrue ? IconUtility.lockopen : IconUtility.lock;
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            lockicon,
            color: AppColors.white,
            size: LockScreenUtil.lockIconSize,
          ),
          shown
        ]),
  );
  ;
}

Column conformed() {
  TherapistGroupController controller = Get.find();
  Widget button = controller.isLockedOpen.isTrue
      ? CustomButton(
          textColor: Colors.white,
          container: AppContainers.purpleButtonContainer(110),
          onTap: () {
            //buradan kategori sayfasina yonlendirilecek
          },
          text: "Grup Sayfasi ")
      : const SizedBox();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenContainerHeight,
        margin: const EdgeInsets.symmetric(
            vertical: LockScreenUtil.lockScreenHeight),
        child: Text(
          "Belgeniz onaylandi devam edebilirsiniz.",
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      button
    ],
  );
}

Column noUpload() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(
            top: LockScreenUtil.lockScreenHeight,
            bottom: LockScreenUtil.lockScreenHeight * 2),
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenContainerHeight,
        child: Text(
          "Terapist Onaylanmasi Gercekletirilmeden Devam Edilemez",
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      GestureDetector(
          onTap: () {
            //onaylama sayfasina gitmeli
          },
          child: Container(
            width: LockScreenUtil.lockScreenContainerWidth,
            height: LockScreenUtil.lockScreenHeight,
            decoration: AppBoxDecoration.lockScreenButton,
            child: Center(
              child: Text("Onayla",
                  style: AppTextStyles.buttonTextStyle(AppColors.white)),
            ),
          ))
    ],
  );
}
