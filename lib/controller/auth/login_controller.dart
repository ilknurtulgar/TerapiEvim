import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';

import '../../core/base/component/toast/toast.dart';
import '../../screen/participant/home/main_home.dart';
import '../../service/model/common/login/login_model.dart';
import '../../service/service/auth/auth_service.dart';
import '../../service/service/auth/i_auth_service.dart';

class LoginController extends GetxController {
  late final IAuthService authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    authService = AuthService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.onInit();
  }

  @override
  void dispose() {
    flutterErrorToast("ON DISPOSE");
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> loginWithEmail() async {
    final isValidated = _validateLogin();

    if (isValidated == false) {
      return;
    }

    isLoading.value = true;

    final UserCredential? result = await authService.signInWithEmail(
      LoginModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    isLoading.value = false;

    if (result == null) {
      flutterErrorToast("Email is incorrect");
      return;
    }

    MainController maiController = Get.find();
    maiController.isLogged.value = true;
    Get.offUntil(
        MaterialPageRoute(builder: (context) => const TerapiEvimLogged()),
        (route) => false);
  }

  bool _validateLogin() {
    if (emailController.text.contains('@') == false) {
      flutterErrorToast("Email is incorrect");
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      flutterErrorToast("Password's length is too short");

      return false;
    }
    return true;
  }
}
