import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/video_call_controller.dart';
import 'package:terapievim/core/base/component/video_call/container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../../../controller/main_controller.dart';
import '../../../ui_models/video_call/video_call_view_model.dart';

class VideoCallPerson extends StatelessWidget {
  VideoCallPerson(
      {super.key,
      required this.videoCallViewModel,
      this.onDoubleTap,
      this.isLongPressActive,
      required this.whichPage});

  final VideoCallViewModel videoCallViewModel;
  final Function()? onDoubleTap;

  /// TODO: bhz-> gizem: it should be final
  bool? isLongPressActive;
  final int whichPage;

  // 1.sayfa group therapy call 2.sayfa isolated call page 3.sayfa short call page

  VideoCallController callController = Get.find();

  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    /// TODO: bhz-> gizem: default value should be set from constructor
    isLongPressActive ??= true;
    return Center(
      child: SizedBox(
        height: videoCallViewModel.isNameShown
            ? videoCallViewModel.height + 40
            : videoCallViewModel.height,
        width: videoCallViewModel.width,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => InkWell(
                  onTap: () => callController
                      .onOffFunction(videoCallViewModel.person.isCamOn),
                  onDoubleTap: onDoubleTap,
                  onLongPress: mainController.isTherapist.value &&
                          whichPage == 1 &&
                          isLongPressActive!
                      ? () => callController.sendIsolatedCall(
                          "${videoCallViewModel.person.name} ${videoCallViewModel.person.surname}")
                      : null,
                  child: Stack(
                      children: [personView(context), micIconButton(context)]),
                ),
              ),
            ),
            videoCallViewModel.isNameShown
                ? nameSurnameText(videoCallViewModel.person.name)
                : const SizedBox(),
            videoCallViewModel.isNameShown
                ? nameSurnameText(videoCallViewModel.person.surname)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget micIconButton(BuildContext context) {
    return Align(
      alignment: videoCallViewModel.height != context.height1
          ? Alignment.bottomRight
          : Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => videoCallViewModel.person.isHandsUp!.value && whichPage == 1
                ? IconUtility.handsUp
                : const SizedBox(),
          ),
          Obx(
            () => IconButton(
                onPressed: () => callController
                    .onOffFunction(videoCallViewModel.person.isMicOn),
                icon: videoCallViewModel.person.isMicOn.value == false
                    ? IconUtility.micoffIcon
                    : IconUtility.micIcon(false)),
          ),
        ],
      ),
    );
  }

  Container personView(BuildContext context) {
    return Container(
        height: videoCallViewModel.height,
        /* height: widget.videoCallViewModel.height,
                                                width: widget.isInShortCallPage &&
                                            */
        width: whichPage == 3 && context.width1 > context.height1
            ? Responsive.width(SizeUtil.normalValueWidth, context)
            : videoCallViewModel.width,
        decoration: BoxDecoration(
            color: AppColors.doveGray,
            border:
                whichPage == 2 && videoCallViewModel.height != context.height1
                    ? Border.all(color: AppColors.black, width: 1)
                    : null,
            borderRadius:
                BorderRadius.circular(videoCallViewModel.borderRadius)),
        child: videoCallViewModel.person.isCamOn.value
            ? cameraOnView()
            : initialLetterContainer(context));
  }

  Text nameSurnameText(String text) => Text(
        text,
        style: const TextStyle(color: AppColors.white),
      );

  Padding initialLetterContainer(BuildContext context) {
    return Padding(
      padding: videoCallViewModel.isTherapistInGroupTherapy
          ? const EdgeInsets.only(bottom: 125)
          : EdgeInsets.zero,
      child: Center(
        child: CircularContainer(
          height: whichPage == 3 && context.width1 > context.height1
              ? Responsive.width(SizeUtil.normalValueWidth, context) / 5
              : videoCallViewModel.width / 3,
          color: AppColors.orange,
          widget: Center(
            child: Text(
              videoCallViewModel.person.name.substring(0, 1),
              style: TextStyle(
                  fontSize: whichPage == 3 && context.width1 > context.height1
                      ? Responsive.width(SizeUtil.normalValueWidth, context) / 8
                      : videoCallViewModel.width / 5,
                  color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect cameraOnView() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(videoCallViewModel.borderRadius),
        child: Image(
          image: AssetImage(videoCallViewModel.person.imagePath),
          fit: BoxFit.fitHeight,
        ));
  }
}
