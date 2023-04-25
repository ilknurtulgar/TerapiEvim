import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
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
    required String meetingId,
    required String therapistHelperId,
    required String participantId,
  }) async {
    return false;
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
}
