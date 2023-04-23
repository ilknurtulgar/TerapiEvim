import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/participant/group/category_determination/short_call/p_determining_to_shortcall_time_view.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';
import 'package:terapievim/screen/participant/group/scl90/p_lock_view.dart';

import '../../../controller/participant/participant_controller.dart';

class PGroupView extends StatelessWidget {
  PGroupView({super.key});

  final ParticipantController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.joinedGroupId.isNotEmpty
        ? const PMyGroupView()
        : _controller.isSessionSelected.isFalse
            ? PShortCallTimeView()
            : const PLockView();
  }
}
