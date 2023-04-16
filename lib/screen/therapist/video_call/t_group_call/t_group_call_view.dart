import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../controller/therapist/video_call/t_group_call_controller.dart';
import '../../../../core/base/component/video_call/buttons/video_call_buttons.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';
import '../../../../product/widget/common/video_call/participant_tile.dart';

class TGroupCallView extends StatelessWidget {
  final VideoCallTokenModel videoCallToken;

  const TGroupCallView({
    Key? key,
    required this.videoCallToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupCallController>(
      getController: TGroupCallController(),
      onModelReady: (controller) {
        controller.setToken(videoCallToken);
      },
      onPageBuilder: (context, controller) => Scaffold(
        backgroundColor: AppColors.doveGray,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              if (controller.participantVideoStreams.values.isNotEmpty)
                if (controller.participantVideoStreams.values.first!.renderer !=
                    null)
                  Positioned.fill(
                    child: ParticipantTile(
                      stream: controller.participantVideoStreams.values.first!,
                      hasPadding: false,
                    ),
                  ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 305,
                    color: Colors.black.withOpacity(0.75),
                  )),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: context.width1,
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...controller.participantVideoStreams.values
                            .map(
                              (e) => ParticipantTile2(
                                stream: e!,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: VideoCallButtonsRow(
                  onToggleMicButtonPressed: () {
                    controller.micEnabled ? controller.room.muteMic() : controller.room.unmuteMic();
                    controller.micEnabled = !controller.micEnabled;
                  },
                  onToggleCameraButtonPressed: () {
                    controller.camEnabled ? controller.room.disableCam() : controller.room.enableCam();
                    controller.camEnabled = !controller.camEnabled;
                  },
                  onLeaveButtonPressed: () => controller.room.leave(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void openTherapistTab(List<PersonInCallModel> participants) {
  //   Get.snackbar('', '',
  //       padding: EdgeInsets.zero,
  //       borderRadius: 0,
  //       margin: EdgeInsets.zero,
  //       backgroundColor: AppColors.mineShaft,
  //       titleText: TherapistTab(participants: participants),
  //       messageText: const SizedBox.shrink(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(minutes: 1));
  // }

  void sendIsolatedCall(String name) {
    Get.dialog(AlertDialog(
      content: Text('$name ${VideoCallTextUtil.sendIsolatedCall}'),
      actions: [
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.no,
              style: AppTextStyles.groupTextStyle(false),
            )),
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              VideoCallTextUtil.yes,
              style: AppTextStyles.groupTextStyle(false),
            )),
      ],
    ));
  }
}
