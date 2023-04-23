import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import 'i_t_profile_service.dart';

class TProfileService extends ITProfileService with BaseService {
  TProfileService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<List<TCopingMethodModel>> getCopingMethodsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
    await manager.readOrdered<TCopingMethodModel, List<TCopingMethodModel>>(
      collectionPath: APIConst.copingMethods,
      docId: userId!,
      parseModel: TCopingMethodModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }
  @override
  Future<List<TActivityModel>> getMyPastActivitiesOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return [];

    final result =
    await manager.readOrderedWhere2<TActivityModel, List<TActivityModel>>(
      collectionPath: APIConst.activities,
      parseModel: TActivityModel(),
      orderField: orderField,
      whereField: AppConst.therapistId,
      whereIsEqualTo: userId!,
      whereField2: AppConst.isFinished,
      whereIsEqualTo2: true,
      isDescending: isDescending,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data ?? [];
  }

}
