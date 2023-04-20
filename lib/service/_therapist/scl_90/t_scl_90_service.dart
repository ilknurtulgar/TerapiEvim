import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../model/common/group/group_category_model.dart';
import '../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
import 'i_t_scl_90_service.dart';

class TScl90Service extends ITScl90Service with BaseService {
  TScl90Service(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<Scl90ResultModel?> getSCLResultById({
    required String participantId,
  }) async {
    if (userId == null) return null;

    final result = await manager.readOne<Scl90ResultModel, Scl90ResultModel>(
      collectionPath: APIConst.scl90,
      docId: participantId,
      parseModel: Scl90ResultModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<bool> setParticipantToACategory({
    required GroupCategoryModel groupCategory,
    required TSessionModel session,
  }) async {
    if (userId == null) return false;

    final categoryResult = await manager.update<GroupCategoryModel, EmptyModel>(
        collectionPath: APIConst.participant,
        docId: groupCategory.participantId,
        data: groupCategory);
    if (categoryResult.error != null) {
      return false;
    }

    session.isFinished = true;

    final sessionResult = await manager.update<TSessionModel, EmptyModel>(
        collectionPath: APIConst.sessions,
        docId: groupCategory.participantId,
        data: session);
    if (categoryResult.error != null) {
      return false;
    }

    if (sessionResult.error != null) {
      return false;
    }
    return true;
  }
}
