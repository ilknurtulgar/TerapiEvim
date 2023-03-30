import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/base/component/toast/toast.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../service/model/common/login/login_model.dart';
import '../../service/model/common/login/login_response_model.dart';
import '../../service/service/auth/auth_service.dart';
import '../../service/service/auth/i_auth_service.dart';
import '../base/base_controller.dart';
import 'auth_controller.dart';

class LoginController extends GetxController with BaseController {
  late final IAuthService authService;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    authService = AuthService(vexaFireManager.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.onInit();
  }

  @override
  void dispose() {
   // flutterErrorToast("ON DISPOSE");
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

    final LoginResponseModel? loginResponse = await authService.signInWithEmail(
      LoginModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    isLoading.value = false;

    if (loginResponse == null) return;

    await saveToLocalData(loginResponse);

    AuthController authController = Get.find();
    authController.isLogged.value = true;
  }

  Future<void> saveToLocalData(LoginResponseModel loginResponse) async {
    try {
      await localManager.setNullableStringValue(
          LocalManagerKeys.name, loginResponse.name);

      await localManager.setNullableStringValue(
          LocalManagerKeys.userId, loginResponse.userId);

      await localManager.setNullableStringValue(
          LocalManagerKeys.birthDate, loginResponse.birthDate);

      await localManager.setNullableStringValue(
          LocalManagerKeys.gender, loginResponse.gender);

      await localManager.setNullableStringValue(
          LocalManagerKeys.email, loginResponse.email);

      await localManager.setNullableStringValue(
          LocalManagerKeys.phone, loginResponse.phone);

      await localManager.setNullableStringValue(
          LocalManagerKeys.role, loginResponse.role);
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error saveToLocalData',
      );
      rethrow;
    }
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
