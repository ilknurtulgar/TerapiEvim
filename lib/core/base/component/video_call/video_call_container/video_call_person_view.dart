import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/video_call/video_call_container/circular_container.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../../screen/participant/video_call/model/video_call_view_model.dart';
import '../../../../../screen/participant/video_call/util/utility.dart';

class VideoCallPersonView extends StatefulWidget {
  const VideoCallPersonView(
      {super.key,
      required this.videoCallViewModel,
      this.onDoubleTap,
      required this.isInShortCallPage});

  final VideoCallViewModel videoCallViewModel;
  final Function()? onDoubleTap;
  final bool isInShortCallPage;

  @override
  State<VideoCallPersonView> createState() => _VideoCallPersonViewState();
}

class _VideoCallPersonViewState extends State<VideoCallPersonView> {
  void cameraOnOffFunc() {
    setState(() {
      widget.videoCallViewModel.person.isCamOn = !widget
          .videoCallViewModel
          .person
          .isCamOn; // bu fonksiyonu kamera açılıp kapandığında görüntünün nasıl değişeceğini gözlemlemek için geçici olarak koydum
    });
  }

  void micOnOffFunc() {
    setState(() {
      widget.videoCallViewModel.person.isMicOn = !widget
          .videoCallViewModel
          .person
          .isMicOn; // bu fonksiyonu mikrofon açılıp kapandığında görüntünün nasıl değişeceğini gözlemlemek için geçici olarak koydum
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: widget.videoCallViewModel.isNameShown
            ? widget.videoCallViewModel.height + 40
            : widget.videoCallViewModel.height,
        width: widget.videoCallViewModel.width,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => cameraOnOffFunc(),
                onDoubleTap: widget.onDoubleTap,
                child: Stack(children: [personView(), micIconButton()]),
              ),
            ),
            widget.videoCallViewModel.isNameShown
                ? nameSurnameText(widget.videoCallViewModel.person.name)
                : const SizedBox(),
            widget.videoCallViewModel.isNameShown
                ? nameSurnameText(widget.videoCallViewModel.person.surname)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget micIconButton() {
    return Positioned(
      top: Responsive.height(8, context),
      right: Responsive.width(8, context),
      child: IconButton(
          onPressed: () => micOnOffFunc(),
          icon: widget.videoCallViewModel.person.isMicOn == false
              ? IconUtility.micoffIcon
              : IconUtility.micIcon(false)),
    );
  }

  Container personView() {
    return Container(
        height: widget.videoCallViewModel.height,
        width: widget.isInShortCallPage &&
                PixelScreen().logicalWidth > PixelScreen().logicalHeight
            ? Responsive.width(SizeUtil.normalValueWidth, context)
            : widget.videoCallViewModel.width,
        decoration: BoxDecoration(
            color: AppColors.doveGray,
            borderRadius:
                BorderRadius.circular(widget.videoCallViewModel.borderRadius)),
        child: widget.videoCallViewModel.person.isCamOn
            ? cameraOnView()
            : initialLetterContainer());
  }

  Text nameSurnameText(String text) => Text(
        text,
        style: const TextStyle(color: AppColors.white),
      );

  Padding initialLetterContainer() {
    return Padding(
      padding: widget.videoCallViewModel.isTherapistInGroupTherapy
          ? const EdgeInsets.only(bottom: 125)
          : EdgeInsets.zero,
      child: Center(
          child: CircularContainer(
              height: widget.isInShortCallPage &&
                      PixelScreen().logicalWidth > PixelScreen().logicalHeight
                  ? Responsive.width(SizeUtil.normalValueWidth, context) / 5
                  : widget.videoCallViewModel.width / 3,
              color: AppColors.orange,
              widget: Center(
                child: Text(
                  widget.videoCallViewModel.person.name.substring(0, 1),
                  style: TextStyle(
                      fontSize: widget.isInShortCallPage &&
                              PixelScreen().logicalWidth >
                                  PixelScreen().logicalHeight
                          ? Responsive.width(
                                  SizeUtil.normalValueWidth, context) /
                              8
                          : widget.videoCallViewModel.width / 5,
                      color: AppColors.white),
                ),
              ))),
    );
  }

  ClipRRect cameraOnView() {
    return ClipRRect(
        borderRadius:
            BorderRadius.circular(widget.videoCallViewModel.borderRadius),
        child: Image(
          image: AssetImage(widget.videoCallViewModel.person.imagePath),
          fit: BoxFit.fitHeight,
        ));
  }
}
