import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../../../../controller/main_controller.dart';
import '../../../../controller/video_call/group_call_controller.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';
import 'modules/participants_box.dart';
import 'modules/therapist_view.dart';

class GroupCallView extends StatelessWidget {
  final VideoCallTokenModel videoCallToken;

  const GroupCallView({
    Key? key,
    required this.videoCallToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    return BaseView<GroupCallController>(
      getController: GroupCallController(),
      onModelReady: (controller) {
        controller.setContext(context);
        controller.setToken(videoCallToken);
      },
      onPageBuilder: (context, controller) => Scaffold(
        backgroundColor: AppColors.doveGray,
        body: SizedBox(
          height: context.height1,
          width: context.width1,
          child: Stack(
            children: [
              TherapistView(controller: controller),
              ParticipantsBoxGroupCall(
                videoCallController: controller,
                mainController: mainController,
                context: context,
                isMainTherapist: videoCallToken.isMainTherapist,
              ),
            ],
          ),
        ),
      ),
    );
  }
}