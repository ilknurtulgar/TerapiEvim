import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../core/base/ui_models/video_call/person_in_call_model.dart';
import '../../../../core/base/ui_models/video_call/video_call_view_model.dart';
import '../../../../core/base/util/base_utility.dart';

class VideoCallUtility {
  static VideoCallViewModel personBigView(
          PersonInCallModel person, bool isTherapistInGroupTherapy) =>
      VideoCallViewModel(
          height: PixelScreen().logicalHeight, // SizeUtil.highestValueHeight,
          width: PixelScreen().logicalWidth,
          borderRadius: 0,
          person: person,
          isNameShown: false,
          isTherapistInGroupTherapy: isTherapistInGroupTherapy);
  static VideoCallViewModel personSmallView(
          PersonInCallModel person, bool isNameShown) =>
      VideoCallViewModel(
          height: SizeUtil.doubleNormalValueHeight,
          width: SizeUtil.smallValueWidth,
          borderRadius: 8,
          person: person,
          isNameShown: isNameShown,
          isTherapistInGroupTherapy: false);
  static VideoCallViewModel personShortCallView(
          PersonInCallModel person, BuildContext context) =>
      VideoCallViewModel(
        height: Responsive.height(
            SizeUtil.hugeValueHeight, context), //SizeUtil.hugeValueHeight,
        width: Responsive.width(
            SizeUtil.generalWidth, context), //SizeUtil.generalWidth,
        borderRadius: 12,
        isNameShown: false,
        isTherapistInGroupTherapy: false,
        person: person,
      );
  static CustomVideoCallButton cameraIconButton(
          Function() onTap, RxBool isCamOn) =>
      CustomVideoCallButton(
        backgroundColor: AppColors.white,
        icon: IconUtility.videcamIcon,
        offIcon: IconUtility.videocamoffIcon,
        onTap: onTap,
        isThisOn: isCamOn,
      );
  static CustomVideoCallButton micIconButton(
          Function() onTap, RxBool isMicOn) =>
      CustomVideoCallButton(
        backgroundColor: AppColors.white,
        icon: IconUtility.micIcon(true),
        offIcon: IconUtility.micoffIcon,
        onTap: onTap,
        isThisOn: isMicOn,
      );
  static CustomVideoCallButton endingCallButton(Function() onTap) =>
      CustomVideoCallButton(
        backgroundColor: AppColors.red,
        icon: IconUtility.callendIcon,
        onTap: onTap,
        isThisOn: true.obs,
      );
  static CustomVideoCallButton therapistSpecialButton(Function() onTap) =>
      CustomVideoCallButton(
          onTap: onTap,
          isThisOn: true.obs,
          icon: IconUtility.moreHorizontal,
          backgroundColor: AppColors.white);
  static CustomVideoCallButton putYourHandsUpButton(
          Function() onTap, RxBool isThisOn) =>
      CustomVideoCallButton(
          onTap: onTap,
          isThisOn: isThisOn,
          icon: IconUtility.handsUp,
          offIcon: IconUtility.handsDown,
          backgroundColor: AppColors.white);
}

class PixelScreen {
  var pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  var physicalScreenSize = window.physicalSize;
  late var physicalWidth = physicalScreenSize.width;
  late var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
  late var logicalScreenSize = window.physicalSize / pixelRatio;
  late var logicalWidth = logicalScreenSize.width;
  late var logicalHeight = logicalScreenSize.height;
}
