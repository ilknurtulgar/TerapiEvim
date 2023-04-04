import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../../controller/video_call_controller.dart';
import '../../../ui_models/video_call/person_in_call_model.dart';
import '../../../ui_models/container_model.dart';
import '../../../ui_models/row_model.dart';
import '../../../util/base_utility.dart';
import '../../buttons/switch_button.dart';
import '../../group/row_view.dart';
import '../../home/custom_container.dart';
import '../../profile/image/custom_circle_avatar.dart';

// ignore: must_be_immutable
class TherapistTab extends StatelessWidget {
  TherapistTab({super.key, required this.participants});
  VideoCallController controller = Get.find();
  final List<PersonInCallModel> participants;
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
            therapistSpecialRow(true, context),
            therapistSpecialRow(false, context),
            expansionTile()
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
      title: const Text(
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
    return rowView(
        RowModel(
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
        const EdgeInsets.symmetric(vertical: 8, horizontal: 16));
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

  IconButton videoCallButton(int index, bool isMicButton) {
    return IconButton(
        onPressed: () {},
        icon: isMicButton
            ? participants[index].isMicOn.value
                ? IconUtility.micIcon(false)
                : IconUtility.micoffIcon
            : participants[index].isCamOn.value
                ? IconUtility.videcamIcon
                : IconUtility.videocamoffIcon);
  }

  Widget therapistSpecialRow(bool isToOpenMics, BuildContext context) {
    return rowView(
        RowModel(
            leadingIcon: isToOpenMics
                ? IconUtility.recordVoiceOver
                : IconUtility.personAddAlt,
            text: isToOpenMics
                ? VideoCallTextUtil.openAllMics
                : VideoCallTextUtil.shareAuthority,
            textStyle: TextStyle(
                color: AppColors.white,
                fontSize: MediaQuery.of(context).size.width <= 360
                    ? isToOpenMics
                        ? 11
                        : 8
                    : null),
            isAlignmentBetween: false,
            trailingIcon: Obx(
              () => SwitchButton(
                  onTap: (value) => controller.therapistSwitchButtonFunction(
                      isToOpenMics, value),
                  value: isToOpenMics
                      ? controller.openAllMics.value
                      : controller.shareAuthority.value),
            )),
        const EdgeInsets.only(left: 16, bottom: 8));
  }
}
