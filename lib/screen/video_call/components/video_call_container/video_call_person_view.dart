import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/video_call/components/video_call_container/circular_container.dart';
import '../../model/video_call_view_model.dart';

class VideoCallPersonView extends StatefulWidget {
  const VideoCallPersonView({super.key, required this.videoCallViewModel, this.onDoubleTap});
  final VideoCallViewModel videoCallViewModel;
  final Function()? onDoubleTap;
  @override
  State<VideoCallPersonView> createState() => _VideoCallPersonViewState();
}

class _VideoCallPersonViewState extends State<VideoCallPersonView> {
  void cameraOnOffFunc() {
    setState(() {
      widget.videoCallViewModel.person.isCamOn = !widget.videoCallViewModel.person.isCamOn; // bu fonksiyonu kamera açılıp kapandığında görüntünün nasıl değişeceğini gözlemlemek için geçici olarak koydum
    });
  }

  void micOnOffFunc() {
    setState(() {
      widget.videoCallViewModel.person.isMicOn = !widget.videoCallViewModel.person.isMicOn; // bu fonksiyonu mikrofon açılıp kapandığında görüntünün nasıl değişeceğini gözlemlemek için geçici olarak koydum
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
            InkWell(
              onTap: () => cameraOnOffFunc(),
              onDoubleTap: widget.onDoubleTap,
              child: Stack(children: [personView(), micIconButton()]),
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

  Align micIconButton() {
    return Align(
      alignment: Alignment.topRight,
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
          ? EdgeInsets.only(bottom: window.physicalSize.height / 3)
          : const EdgeInsets.all(0),
      child: Center(
          child: CircularContainer(
              height: widget.videoCallViewModel.width / 2.5,
              color: AppColors.orange,
              widget: Text(
                widget.videoCallViewModel.person.name.substring(0, 1),
                style: TextStyle(
                    fontSize: widget.videoCallViewModel.width / 4,
                    color: AppColors.white),
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
