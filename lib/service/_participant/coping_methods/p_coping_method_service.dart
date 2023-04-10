import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import 'i_p_coping_method_service.dart';

class PCopingMethodService extends IPCopingMethodService with BaseService {
  PCopingMethodService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<TCopingMethodModel?> getCopingMethodById(String copingMethodId) async {
    if (userId == null) return null;

    final result =
        await manager.readOne<TCopingMethodModel, TCopingMethodModel>(
      collectionPath: APIConst.copingMethods,
      docId: copingMethodId,
      parseModel: TCopingMethodModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<TCopingMethodModel?>?> getCopingMethods({
    required String groupId,
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return null;

    final result = await manager.readOrderedWhere(
      collectionPath: APIConst.users,
      docId: userId,
      collectionPath2: APIConst.users,
      parseModel: TCopingMethodModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
      whereField: AppConst.groupId,
      whereIsEqualTo: groupId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }
}
