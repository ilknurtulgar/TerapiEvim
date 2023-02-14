import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../toast/toast.dart';
import '../../screen/participant/home/main_home.dart';
import '../../service/model/common/signup/sign_up_model.dart';
import '../../service/service/auth/auth_service.dart';
import '../../service/service/auth/i_auth_service.dart';
import '../main_controller.dart';

class SignUpController extends GetxController {
  late final IAuthService authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final TextEditingController birthDateController;
  late final TextEditingController genderController;
  late final TextEditingController phoneController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  late final FocusNode nameFocusNode;
  late final FocusNode birthDateFocusNode;
  late final FocusNode genderFocusNode;
  late final FocusNode phoneFocusNode;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    authService = AuthService();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    birthDateController = TextEditingController();
    genderController = TextEditingController();
    phoneController = TextEditingController();

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    birthDateFocusNode = FocusNode();
    genderFocusNode = FocusNode();
    phoneFocusNode = FocusNode();

    super.onInit();
  }

  @override
  void dispose() {
    ///dispose text editing controllers
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    phoneController.dispose();

    /// dispose focus nodes
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    birthDateFocusNode.dispose();
    genderFocusNode.dispose();
    phoneFocusNode.dispose();

    super.dispose();
  }

  Future<void> signUpWithEmail() async {
    final bool isValidated = _validateSignUp();
    if (isValidated == false) {
      return;
    }

    isLoading.value = true;

    final UserCredential? result =
        await authService.signUpWithEmail(SignUpModel(
      name: nameController.text.trim(),
      birthDate: birthDateController.text.trim(),
      gender: genderController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
    ));
    isLoading.value = false;

    if (result == null) {
      //TODO: add error that something went wrong
      return;
    }

    MainController maiController = Get.find();
    maiController.isLogged.value = true;

    ///TODO:  save user data to cache

    Get.offUntil(
        MaterialPageRoute(builder: (context) => const TerapiEvimLogged()),
            (route) => false);
  }

  bool _validateSignUp() {
    if (emailController.text.contains('@') == false) {
      flutterErrorToast("Email is incorrect");
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      flutterErrorToast("Password's length is too short");
      return false;
    }
    if (nameController.text.trim().isEmpty) {
      flutterErrorToast("Name is empty");
      return false;
    }
    if (birthDateController.text.trim().isEmpty) {
      flutterErrorToast("Birthday is empty");
      return false;
    }

    // if (genderController.text.trim().isEmpty) {
    //   flutterErrorToast("Gender is empty");
    //   return false;
    // }
    if (phoneController.text.trim().isEmpty) {
      flutterErrorToast("Phone is empty");
      return false;
    }

    return true;
  }
}
