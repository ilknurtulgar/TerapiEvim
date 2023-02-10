import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    super.onInit();
  }

  @override
  void dispose() {
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
      //TODO: add error that something went wrong
      return;
    }

    ///TODO Handle result
  }

  bool _validateLogin() {
    if (emailController.text.contains('@') == false) {
      //TODO: add error that email is incorrect
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      //TODO: add error that length is too short
      return false;
    }
    return true;
  }
}
