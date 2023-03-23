import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/participant/group/category_determination/group_categories/group_categories.dart';

import '../../../controller/main_controller.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // return _controller.isGroupReady.isTrue
    //     ? const MyGroup()
    //     : const LockScreen();
    return const GroupCategories();
  }
}
