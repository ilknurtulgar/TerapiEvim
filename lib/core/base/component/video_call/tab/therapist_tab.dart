import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/video_call/group_call_controller.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../screen/common/video_call/util/utility.dart';
import '../../../ui_models/container_model.dart';
import '../../../ui_models/row_model.dart';
import '../../../ui_models/video_call/person_in_call_model.dart';
import '../../../util/base_utility.dart';
import '../../../util/text_utility.dart';
import '../../buttons/switch_button.dart';
import '../../group/row_view.dart';
import '../../home/custom_container.dart';
import '../../profile/image/custom_circle_avatar.dart';

// ignore: must_be_immutable
class TherapistTab extends StatelessWidget {
  TherapistTab(
      {super.key, required this.participants, required this.whoHasControl});

  GroupCallController controller = Get.find();
  final List<PersonInCallModel> participants;
  Rx<TherapistTabController> whoHasControl;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      containerModel:
          ContainerModel(borderRadius: 0, backgroundColor: AppColors.mineShaft),
      isThereShadow: false,
      isThereCardModel: false,
      widget: Padding(
        padding: AppPaddings.customContainerInsidePadding(3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            closeTabButton(),
            Obx(() => whoHasControl.value ==
                        TherapistTabController.MainTherapistHasControl ||
                    whoHasControl.value ==
                        TherapistTabController.SecondTherapistHasControl
                ? therapistSpecialRow(true, context)
                : const SizedBox.shrink()),
            Obx(() => whoHasControl.value ==
                    TherapistTabController.MainTherapistHasControl
                ? therapistSpecialRow(false, context)
                : const SizedBox.shrink()),
            expansionTile(),
            Obx(
              () => whoHasControl.value ==
                          TherapistTabController.MainTherapistHasControl ||
                      whoHasControl.value ==
                          TherapistTabController.SecondTherapistHasControl
                  ? Padding(
                      padding: AppPaddings.componentOnlyPadding(1),
                      child: responsivenestext(
                        VideoCallTextUtil.therapistTabInformation,
                        TextStyle(color: AppColors.white),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionTile expansionTile() {
    return ExpansionTile(
      iconColor: AppColors.white,
      collapsedIconColor: AppColors.white,
      backgroundColor: AppColors.doveGray,
      collapsedBackgroundColor: AppColors.doveGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          IconUtility.groupsIcon.icon!,
          color: Colors.white,
        ),
      ),
      title: Text(
        VideoCallTextUtil.participants,
        style: TextStyle(color: AppColors.white),
      ),
      tilePadding: const EdgeInsets.only(right: 16),
      children: [
        SizedBox(
          height: SizeUtil.highValueHeight,
          child: ListView.builder(
              itemCount: participants.length,
              itemBuilder: (context, index) {
                return personRow(index);
              }),
        )
      ],
    );
  }

  Widget personRow(int index) {
    return RowView(
        rowModel: RowModel(
            leadingIcon: CustomCircleAvatar(
                imagePath: participants[index].imagePath,
                big: false,
                shadow: false),
            text: participants[index].name,
            textStyle: const TextStyle(color: AppColors.white),
            isAlignmentBetween: false,
            trailingIcon: Row(
              children: [
                videoCallButton(index, true),
                videoCallButton(index, false)
              ],
            )),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16));
  }

  Padding closeTabButton() {
    return Padding(
      padding: AppPaddings.componentOnlyPadding(2),
      child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Get.closeCurrentSnackbar(),
            icon: Icon(
              IconUtility.closeIcon.icon!,
              color: Colors.white,
              size: 30,
            ),
            alignment: Alignment.topCenter,
          )),
    );
  }

  Widget videoCallButton(int index, bool isMicButton) {
    return isMicButton
        ? Obx(
            () => whoHasControl.value ==
                    TherapistTabController.SecondTherapistHasNotControl
                ? Obx(
                    () => participants[index].isMicOn.value
                        ? IconUtility.micIcon(false)
                        : IconUtility.micoffIcon,
                  )
                : VideoCallUtility.micIconButton(
                 onTap:    () => controller.onOffFunction(participants[index].isMicOn),
                isInsideContainer:     false,
                  isMicOn:   participants[index].isMicOn),
          )
        : Padding(
            padding: AppPaddings.componentOnlyPadding(4),
            child: Obx(
              () => participants[index].isCamOn.value
                  ? IconUtility.videcamIcon
                  : IconUtility.videocamoffIcon,
            ),
          );
    /* VideoCallUtility.cameraIconButton(
            () {}, false, participants[index].isCamOn);*/
  }

  Widget therapistSpecialRow(bool isToOpenMics, BuildContext context) {
    return RowView(
        rowModel: RowModel(
            leadingIcon: isToOpenMics
                ? IconUtility.recordVoiceOver
                : IconUtility.personAddAlt,
            text: isToOpenMics
                ? VideoCallTextUtil.openAllMics
                : VideoCallTextUtil.shareAuthority,
            textStyle: TextStyle(
                color: AppColors.white,
                fontSize: context.width1 <= 360
                    ? isToOpenMics
                        ? 11
                        : 8
                    : null),
            isAlignmentBetween: false,
            trailingIcon: Obx(
              () => SwitchButton(
                  onTap: (value) => controller.therapistSwitchButtonFunction(
                      isToOpenMics, value,
                      participants: isToOpenMics ? participants : null),
                  value: isToOpenMics
                      ? controller.openAllMics.value
                      : controller.shareAuthority.value),
            )),
        padding: const EdgeInsets.only(left: 16, bottom: 8));
  }
}

enum TherapistTabController {
  MainTherapistHasControl,
  SecondTherapistHasControl,
  SecondTherapistHasNotControl,
}
