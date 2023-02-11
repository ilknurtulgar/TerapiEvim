import 'package:flutter/material.dart';

import 'package:terapievim/core/base/util/base_utility.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blueChalk,
      body: Center(child: Text("login")),
    );
  }
}
