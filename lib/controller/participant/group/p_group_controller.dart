import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/therapist/group/t_group_model.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/profile/p_public_profile_model.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../model/therapist/group/t_group_session_model.dart';
import '../../../screen/common/video_call/group_call/group_call_view.dart';
import '../../../service/_participant/group/i_p_group_service.dart';
import '../../../service/_participant/group/p_group_service.dart';
import '../../base/base_controller_2.dart';
import '../participant_controller.dart';

class PGroupController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  Future<void> onInit() async {
    _ipGroupService = PGroupService(vexaFireManager.networkManager);
    await fetchRecentGroupSession();
    super.onInit();
  }

  late IPGroupService _ipGroupService;

  var isTrue = true.obs;

  var selectedValue = 2.obs;
  String currentGroupId = '';

  Rx<TGroupSessionModel?> tGroupSession = TGroupSessionModel().obs;
  TGroupModel? currentGroup;

  Future<void> fetchRecentGroupSession() async {
    try {
      final ParticipantController _participantController = Get.find();

      currentGroupId = _participantController.joinedGroupId.value;

      final TGroupSessionModel? groupSession =
          await _ipGroupService.getRecentGroupSession(currentGroupId);
      if (groupSession != null) {
        tGroupSession.value = groupSession;
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error fetchRecentGroupSession',
      );
      rethrow;
    }
  }

  Future<void> joinVideoCall() async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();

      if (tGroupSession.value?.meetingId == null) return;
      if (tGroupSession.value!.meetingId!.isEmpty) {
        flutterInfoToast("Group session is not started");
        return;
      }

      controllerContext.pushTrueRootNavigatorAndRemove(
        GroupCallView(
          videoCallToken: VideoCallTokenModel(
            meetingId: tGroupSession.value!.meetingId!,
            token: videoSdkManager.token,
            participantId: userId!,
            isTherapist: false,
          ),
        ),
      );
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error joinVideoCall',
      );
      rethrow;
    }
  }

  void dropvalue(value) {
    selectedValue.value = value;
  }

//my group bilgileri alinmali
//terapist isim yardimci terapist isiim en yakin meeting tarihi ve saati katilimcilarin isimleri ve imageleri
  late List<PPublicProfile> participants = <PPublicProfile>[].obs;

  Future<void> getParticipants() async {
    participants = await _ipGroupService.getParticipantsList(
        participantsId: currentGroup?.participantsId ?? <String>[]);
  }

  Future<void> fetchMyGroup() async {
    try {
      final ParticipantController _participantController = Get.find();

      currentGroupId = _participantController.joinedGroupId.value;

      final TGroupModel? fetchedGroup =
          await _ipGroupService.getCurrentGroup(currentGroupId);
      if (fetchedGroup != null) {
        currentGroup = fetchedGroup;
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error fetchRecentGroupSession',
      );
      rethrow;
    }
  }
}
