import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        : const PLockView();
  }
}
