import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../model/participant/_initial_data/p_initial_data.dart';
import '../../product/enum/local_keys_enum.dart';
import '../../service/auth/auth_service.dart';
import '../../service/auth/i_auth_service.dart';
import '../base/base_controller_2.dart';

class ParticipantController extends BaseController2 {
  void setContext(BuildContext context) {}

  /// since IAuthService has ready service, it is here as well
  late final IAuthService authService;

  @override
  void onInit() {
    authService = AuthService(vexaFireManager.networkManager);
    _fetchInitialDataOfParticipant();
    super.onInit();
  }

  RxString joinedGroupId = ''.obs;

  RxString groupCategory = ''.obs;

  RxBool isJoinedGroupLocked = true.obs;

  RxBool isScl90Submitted = false.obs;

  RxBool isSessionComplete = false.obs;

  RxBool isTestResultReady = false.obs;


  Future<void> _fetchInitialDataOfParticipant() async {

    final PInitialData? initialDataOfParticipantModel =
        await authService.fetchInitialDataOfParticipant();

    joinedGroupId.value = initialDataOfParticipantModel?.joinedGroupId ?? '';

    groupCategory.value = initialDataOfParticipantModel?.groupCategory ?? '';

    isJoinedGroupLocked.value =
        initialDataOfParticipantModel?.isJoinedGroupLocked ?? true;

    isScl90Submitted.value =
        initialDataOfParticipantModel?.isScl90Submitted ?? false;

    isSessionComplete.value =
        initialDataOfParticipantModel?.isSessionComplete ?? false;

    isTestResultReady.value =
        initialDataOfParticipantModel?.isTestResultReady ?? false;

    /// Save joinedGroupId of a participant
    localManager.setStringValue(
        LocalManagerKeys.pJoinedGroupId, joinedGroupId.value);

    localManager.setStringValue(
        LocalManagerKeys.pGroupCategory, groupCategory.value);

    localManager.setBoolValue(
        LocalManagerKeys.pIsJoinedGroupLocked, isJoinedGroupLocked.value);

    localManager.setBoolValue(
        LocalManagerKeys.pIsTestResultReady, isTestResultReady.value);

    localManager.setBoolValue(
        LocalManagerKeys.pIsScl90Submitted, isScl90Submitted.value);

    localManager.setBoolValue(
        LocalManagerKeys.pIsSessionComplete, isSessionComplete.value);
  }
}
