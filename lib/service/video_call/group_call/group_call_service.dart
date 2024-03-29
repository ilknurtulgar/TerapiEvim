import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terapievim/model/participant/video_call/therapist_helper_group_call_model.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/participant/video_call/participant_group_call_model.dart';
import 'i_group_call_service.dart';

class GroupCallService extends IGroupCallService {
  GroupCallService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<bool> tSetAGroupRoom(String meetingId) async {
    if (userId == null) return false;

    final isSuccess = await manager.createWithDocId(
        collectionPath: APIConst.groupRoom,
        docId: meetingId,
        data: {AppConst.meetingId: meetingId});

    return isSuccess;
  }

  @override
  Future<bool> tSendParticipantToIsolatedCall({
    required String therapistHelperId,
    required String previousMeetingId,
    required ParticipantGroupCallModel groupCallModel,
  }) async {
    try {
      ///groupRoom/meetingId/participantId/participantId
      final isSuccess =
          await manager.update<ParticipantGroupCallModel, EmptyModel>(
        collectionPath: APIConst.groupRoom,
        docId: previousMeetingId,
        collectionPath2: groupCallModel.participantId!,
        docId2: groupCallModel.participantId!,
        data: groupCallModel,
      );
      if (isSuccess.error != null) return false;

      ///groupRoom/meetingId/participantId/participantId
      final isTherapistHelperSuccess =
          await manager.update<TherapistHelperGroupCallModel, EmptyModel>(
        collectionPath: APIConst.groupRoom,
        docId: previousMeetingId,
        collectionPath2: therapistHelperId,
        docId2: therapistHelperId,
        data: TherapistHelperGroupCallModel(
          meetingId: groupCallModel.meetingId,
          therapistHelperId: therapistHelperId,
          isTherapistSendToIsolatedCall: true,
        ),
      );
      if (isTherapistHelperSuccess.error != null) return false;

      return true;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return false;
    }
  }

  @override
  Future<bool> pInit(
      {required ParticipantGroupCallModel participantGroupCall}) async {
    if (userId == null) return false;

    ///groupRoom/meetingId/participantId/participantId
    final isSuccess = await manager.createWithDocId(
      collectionPath: APIConst.groupRoom,
      docId: participantGroupCall.meetingId!,
      collectionPath2: participantGroupCall.participantId!,
      docId2: participantGroupCall.participantId!,
      data: participantGroupCall.toJson()!,
    );

    return isSuccess;
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>>? pSetRoomListener(
      {required String meetingId, required String participantId}) {
    final stream = manager.setStreamListener(
      collectionPath: APIConst.groupRoom,
      docId: meetingId,
      collectionPath2: participantId,
      docId2: participantId,
    );
    return stream;
  }

  @override
  Future<bool> tHelperInit(
      {required TherapistHelperGroupCallModel therapistHelperGroupCall}) async {
    if (userId == null) return false;

    ///groupRoom/meetingId/participantId/participantId
    final isSuccess = await manager.createWithDocId(
      collectionPath: APIConst.groupRoom,
      docId: therapistHelperGroupCall.meetingId!,
      collectionPath2: therapistHelperGroupCall.therapistHelperId!,
      docId2: therapistHelperGroupCall.therapistHelperId!,
      data: therapistHelperGroupCall.toJson()!,
    );

    return isSuccess;
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>>? tHelperSetRoomListener({
    required String meetingId,
    required String therapistHelperId,
  }) {
    final stream = manager.setStreamListener(
      collectionPath: APIConst.groupRoom,
      docId: meetingId,
      collectionPath2: therapistHelperId,
      docId2: therapistHelperId,
    );
    return stream;
  }
}
