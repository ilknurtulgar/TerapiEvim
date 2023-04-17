import 'package:flutter/material.dart';

import '../../../../controller/therapist/video_call/t_short_call_controller.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';

class TShortCallView extends StatelessWidget {
  const TShortCallView({Key? key, required this.videoCallToken})
      : super(key: key);
  final VideoCallTokenModel videoCallToken;

  @override
  Widget build(BuildContext context) {
    return BaseView<TShortCallController>(
      getController: TShortCallController(),
      onModelReady: (controller) {
        controller.setContext(context);
        controller.setToken(videoCallToken);
      },
      onPageBuilder: (context, controller) {
        return Scaffold();
      },
    );
  }
}
