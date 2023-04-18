import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';

import '../../../controller/main_controller.dart';

import 'scl90/p_lock_view.dart';

class PGroupView extends StatelessWidget {
  PGroupView({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return _controller.isGroupReady.isTrue
        ? const PMyGroupView()
        : const PLockView();
  }
}
