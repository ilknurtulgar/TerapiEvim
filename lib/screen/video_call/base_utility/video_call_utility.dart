import 'dart:ui';

import 'package:terapievim/screen/video_call/components/buttons/video_call_buttons.dart';

import '../model/person_in_call_model.dart';
import '../model/video_call_view_model.dart';
import '../../../core/base/util/base_utility.dart';

class VideoCallUtility {
  static VideoCallViewModel personBigView(
          PersonInCallModel person, bool isTherapistInGroupTherapy) =>
      VideoCallViewModel(
          height: window.physicalSize.height,
          width: window.physicalSize.width,
          borderRadius: 0,
          person: person,
          isNameShown: false,
          isTherapistInGroupTherapy: isTherapistInGroupTherapy);
  static VideoCallViewModel personSmallView(
          PersonInCallModel person, bool isNameShown) =>
      VideoCallViewModel(
          height: 129,
          width: 92,
          borderRadius: 8,
          person: person,
          isNameShown: isNameShown,
          isTherapistInGroupTherapy: false);
  static VideoCallViewModel personShortCallView(PersonInCallModel person) =>
      VideoCallViewModel(
        height: 320,
        width: 340,
        borderRadius: 12,
        isNameShown: false,
        isTherapistInGroupTherapy: false,
        person: person,
      );
  static CustomVideoCallButton cameraIconButton(
          Function() onTap, bool isCamOn) =>
      CustomVideoCallButton(
        backgroundColor: AppColors.white,
        icon: IconUtility.videcamIcon,
        offIcon: IconUtility.videocamoffIcon,
        onTap: onTap,
        isThisOn: isCamOn,
      );
  static CustomVideoCallButton micIconButton(Function() onTap, bool isMicOn) =>
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
        isThisOn: true,
      );
}
