import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/video_call/container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/video_call/util/utility.dart';
import 'package:videosdk/videosdk.dart';

import '../../../ui_models/video_call/video_call_view_model.dart';

class VideoCallPerson extends StatelessWidget {
  VideoCallPerson({
    super.key,
    required this.videoCallViewModel,
    required this.whichPage,
    this.onDoubleTap,
    this.onLongPressed,
    required this.micOnOffFunction,
    required this.cameraOnOffFunction,
    this.videoStream,
  });

  final VideoCallViewModel videoCallViewModel;
  final Function()? onDoubleTap;
  final VideoCallPages whichPage;
  final Function()? onLongPressed;
  final Function()? micOnOffFunction;
  final Function()? cameraOnOffFunction;
  final RTCVideoRenderer? videoStream;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: videoCallViewModel.isNameShown
            ? videoCallViewModel.height + 40
            : videoCallViewModel.height,
        width: videoCallViewModel.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: InkWell(
                onTap: cameraOnOffFunction,
                onDoubleTap: onDoubleTap,
                onLongPress: onLongPressed,
                child: Stack(children: [
                  personView(context, videoStream),
                  iconButtonsRow(context),
                ]),
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

  Widget iconButtonsRow(BuildContext context) {
    return Align(
      alignment: videoCallViewModel.height != context.height1
          ? Alignment.bottomRight
          : Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => videoCallViewModel.person.isHandsUp!.value &&
                    whichPage == VideoCallPages.groupCall
                ? IconUtility.handsUp
                : const SizedBox(),
          ),
          VideoCallUtility.micIconButton(
              micOnOffFunction!, false, videoCallViewModel.person.isMicOn)
        ],
      ),
    );
  }

  Container personView(BuildContext context, RTCVideoRenderer? videoStream) {
    return Container(
        height: videoCallViewModel.height,
        width: videoCallViewModel.width,
        decoration: BoxDecoration(
            color: AppColors.doveGray,
            border: whichPage == VideoCallPages.isolatedCall &&
                    videoCallViewModel.height != context.height1
                ? Border.all(color: AppColors.black, width: 1)
                : null,
            borderRadius:
                BorderRadius.circular(videoCallViewModel.borderRadius)),
        child:
        // Obx(
          // () => videoCallViewModel.person.isCamOn.value
          // () =>
          videoStream != null
              ? cameraOnView(videoStream)
              : initialLetterContainer(context),
        // )
    );
  }

  Widget nameSurnameText(String text) => responsivenestext(
        text,
        const TextStyle(color: AppColors.white, fontSize: 15),
      );

  Padding initialLetterContainer(BuildContext context) {
    return Padding(
      padding: videoCallViewModel.isTherapistInGroupTherapy
          ? const EdgeInsets.only(bottom: 125)
          : EdgeInsets.zero,
      child: Center(
        child: CircularContainer(
          height: videoCallViewModel.width / 3,
          color: AppColors.orange,
          widget: Center(
            child: Text(
              videoCallViewModel.person.name.substring(0, 1),
              style: TextStyle(
                  fontSize: videoCallViewModel.width / 5,
                  color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect cameraOnView(RTCVideoRenderer videoStream) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(videoCallViewModel.borderRadius),
        child: RTCVideoView(
          videoStream,
          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        ));
  }
}

enum VideoCallPages {
  groupCall,
  isolatedCall,
  shortCall,
}
