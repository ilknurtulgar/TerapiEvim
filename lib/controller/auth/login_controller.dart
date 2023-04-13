import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/main_controller.dart';

import '../../core/base/component/toast/toast.dart';
import '../../core/constants/app_const.dart';
import '../../model/participant/_initial_data/p_initial_data.dart';
import '../../model/common/login/login_model.dart';
import '../../model/common/login/login_response_model.dart';
import '../../model/therapist/_initial_data/t_initial_data.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../service/auth/auth_service.dart';
import '../../service/auth/i_auth_service.dart';
import '../base/base_controller.dart';
import 'auth_controller.dart';

class LoginController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

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
    try {
      final isValidated = _validateLogin();

      if (isValidated == false) {
        return;
      }

      isLoading.value = true;

      final LoginResponseModel? loginResponse =
          await authService.signInWithEmail(
        LoginModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      isLoading.value = false;

      if (loginResponse == null) return;

      if (loginResponse.role == null) {
        throw Exception('loginResponse.role == null');
      }

      /// Fetch initial data of a particular user and save to cache
      /// Roles: therapist and participant
      if (loginResponse.role == AppConst.therapist) {
        await _initialDataOfTherapist(loginResponse);
      } else if (loginResponse.role == AppConst.participant) {
        await _fetchInitialDataOfParticipant();
      }

      await saveToLocalData(loginResponse);

      MainController mainController = Get.find();
      mainController.updateWhoItIs(loginResponse.role!);
      AuthController authController = Get.find();
      authController.isLogged.value = true;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      rethrow;
    }
  }

  Future<void> _initialDataOfTherapist(LoginResponseModel loginResponse) async {
    final TInitialData? initialDataOfTherapist =
        await authService.fetchInitialDataOfTherapist();
    await localManager.setStringValue(LocalManagerKeys.aboutMe, loginResponse.aboutMe ?? "");
    ///TODO: save initial Data to cache
  }

  Future<void> _fetchInitialDataOfParticipant() async {
    final PInitialData? initialDataOfParticipantModel =
        await authService.fetchInitialDataOfParticipant();

    /// Save joinedGroupId of a participant
    localManager.setStringValue(LocalManagerKeys.joinedGroupId,
        initialDataOfParticipantModel?.joinedGroupId ?? '');

    ///TODO: save initial Data to cache
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
