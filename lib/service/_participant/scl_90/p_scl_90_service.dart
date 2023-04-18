import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../model/participant/scl90test/scl_90_submission_model.dart';
import 'i_p_scl_90_service.dart';

class PScl90Service extends IPScl90Service with BaseService {
  PScl90Service(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<CreatedIdResponse?> submitTest(Scl90ResultModel scl90) async {
    if (userId == null) return null;

    /// Setting id of a current participant
    scl90.participantId = userId;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.scl90,
      data: scl90.toJson()!,
    );

    if (createdIdResponse == null) return null;

    final result = await manager.update<Scl90SubmissionModel,EmptyModel>(
      collectionPath: APIConst.participant,
      docId: userId!,
      data: Scl90SubmissionModel(isScl90Submitted: true),
    );

    if (result.error != null) return null;

    return createdIdResponse;
  }
}
