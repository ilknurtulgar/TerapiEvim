import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/base/service/base_service.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/participant/video_call/participant_group_call_model.dart';

abstract class IGroupCallService extends BaseService {
  IGroupCallService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<bool> tSetAGroupRoom(String meetingId);

  Future<bool> tSendParticipantToIsolatedCall({
    required String meetingId,
    required String therapistHelperId,
    required String participantId,
  });

  Future<bool> pInit(
      {required ParticipantGroupCallModel participantGroupCall});

  Stream<DocumentSnapshot<Map<String, dynamic>>>? pSetRoomListener({
    required String meetingId,
    required String participantId,
  });

}
