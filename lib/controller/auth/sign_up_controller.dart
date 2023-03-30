import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/extension/context_extension.dart';
import '../../core/base/component/toast/toast.dart';
import '../../core/constants/utils/text_constants/error_text_const.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../screen/participant/home/main_home.dart';
import '../../service/model/common/signup/sign_up_model.dart';
import '../../service/service/auth/auth_service.dart';
import '../../service/service/auth/i_auth_service.dart';
import '../base/base_controller.dart';

class SignUpController extends GetxController with BaseController {

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

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

  String _userRole = '';

  String get userRole => _userRole;

  set setUserRole(String value) {
    _userRole = value;
  }

  RxBool isLoading = false.obs;
  RxBool isTermsOfUseAccepted = false.obs;

  @override
  void onInit() {
    authService = AuthService(vexaFireManager.networkManager);
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

  Future<void> signUpWithEmail(BuildContext context) async {
    final bool isValidated = _validateSignUp();
    if (isValidated == false) {
      return;
    }

    isLoading.value = true;

    final String? userId = await authService.signUpWithEmail(
        signUpModel: SignUpModel(
          name: nameController.text.trim(),
          birthDate: birthDateController.text.trim(),
          gender: genderController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          role: _userRole,
        ),
        password: passwordController.text.trim());

    if (userId == null) {
      flutterErrorToast(ErrorConst.somethingWentWrong);
      isLoading.value = false;
      return;
    }

    await saveToLocalData(userId);

    isLoading.value = false;

    context.pushAndRemoveUntil(TerapiEvimLogged());
  }

  Future<void> saveToLocalData(String userId) async {
    try {
      await localManager.setStringValue(
          LocalManagerKeys.name, nameController.text.trim());

      await localManager.setNullableStringValue(
          LocalManagerKeys.userId, userId);

      await localManager.setStringValue(
          LocalManagerKeys.birthDate, birthDateController.text.trim());

      await localManager.setStringValue(
          LocalManagerKeys.gender, genderController.text.trim());

      await localManager.setStringValue(
          LocalManagerKeys.email, emailController.text.trim());

      await localManager.setStringValue(
          LocalManagerKeys.phone, phoneController.text.trim());

      await localManager.setStringValue(LocalManagerKeys.role, _userRole);
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error saveToLocalData',
      );
      rethrow;
    }
  }

  bool _validateSignUp() {
    if (emailController.text.contains('@') == false) {
      flutterErrorToast(ErrorConst.wrongEmail);
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      flutterErrorToast(ErrorConst.passwordLengthIsShort);
      return false;
    }
    if (nameController.text.trim().isEmpty) {
      flutterErrorToast(ErrorConst.nameIsEmpty);
      return false;
    }
    if (birthDateController.text.trim().isEmpty) {
      flutterErrorToast(ErrorConst.birthdateEmpty);
      return false;
    }

    if (genderController.text.trim().isEmpty) {
      flutterErrorToast("Gender is empty");
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      flutterErrorToast(ErrorConst.phoneNumberIsEmpty);
      return false;
    }

    if (isTermsOfUseAccepted.value == false) {
      ///TODO this condition should be deleted in production
      if (kDebugMode) {
        flutterInfoToast("Setting isTermsOfUseAccepted to true in debug ");
        return true;
      }

      flutterInfoToast(ErrorConst.acceptTermsOfUse);
      return false;
    }

    /// Check if role is not empty
    if (_userRole == '') {
      flutterInfoToast(ErrorConst.exceptionRoleNotSelected);
      return false;
    }
    return true;
  }

}
