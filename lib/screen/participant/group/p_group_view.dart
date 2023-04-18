import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/participant/participant_controller.dart';
import 'scl90/p_lock_view.dart';

class PGroupView extends StatelessWidget {
  PGroupView({super.key});

  final ParticipantController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.joinedGroupId.isNotEmpty
        ? const PLockView()
        : const PLockView();
  }
}
