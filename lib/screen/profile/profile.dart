import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';

import 'package:terapievim/screen/group/participant_ui/scl90/test_for_users.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final ProfileController profileController = Get.put(ProfileController());

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Test());
  }
}
