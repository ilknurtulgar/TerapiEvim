import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../model/therapist/_initial_data/t_initial_data.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../service/auth/auth_service.dart';
import '../../service/auth/i_auth_service.dart';
import '../base/base_controller_2.dart';

class TherapistController extends BaseController2 {
  void setContext(BuildContext context) {}

  /// since IAuthService has ready service, it is here as well
  late final IAuthService authService;

  @override
  void onInit() {
    authService = AuthService(vexaFireManager.networkManager);

    _initialDataOfTherapist();
    super.onInit();
  }

  RxBool isTherapistConfirmed = false.obs;

  RxBool isTherapistBeingReviewed = true.obs;

  RxBool isBeingAdvisorAccepted = false.obs;

  RxInt maxNumberOfHelpingGroups = 0.obs;

  RxBool isDiplomaUploaded = false.obs;

  Future<void> _initialDataOfTherapist() async {
    final TInitialData? initialDataOfTherapist =
        await authService.fetchInitialDataOfTherapist();

    isTherapistConfirmed.value =
        initialDataOfTherapist?.isTherapistConfirmed ?? false;

    isTherapistBeingReviewed.value =
        initialDataOfTherapist?.isTherapistBeingReviewed ?? true;

    isBeingAdvisorAccepted.value =
        initialDataOfTherapist?.isBeingAdvisorAccepted ?? false;

    maxNumberOfHelpingGroups.value =
        initialDataOfTherapist?.maxNumberOfHelpingGroups ?? 0;

    isDiplomaUploaded.value =
        initialDataOfTherapist?.isDiplomaUploaded ?? false;

    await localManager.setBoolValue(
        LocalManagerKeys.isTherapistConfirmed, isTherapistConfirmed.value);

    await localManager.setBoolValue(LocalManagerKeys.isTherapistBeingReviewed,
        isTherapistBeingReviewed.value);

    await localManager.setBoolValue(
        LocalManagerKeys.isBeingAdvisorAccepted, isBeingAdvisorAccepted.value);

    await localManager.setBoolValue(
        LocalManagerKeys.isDiplomaUploaded, isDiplomaUploaded.value);

    await localManager.setIntValue(
        LocalManagerKeys.maxNumberOfGroups, maxNumberOfHelpingGroups.value);
  }


}
