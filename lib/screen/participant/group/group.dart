import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_controller.dart';
import '../profile/last_review.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return LastReview();
    // return _controller.isGroupReady.isTrue
    //     ? const MyGroup()
    //     : const LockScreen();
  }
}
