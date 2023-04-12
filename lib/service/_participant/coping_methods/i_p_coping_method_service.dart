import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';

abstract class IPCopingMethodService {
  IPCopingMethodService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<TCopingMethodModel?> getCopingMethodById(String copingMethodId);

  Future<List<TCopingMethodModel?>> getCopingMethods({
    required String groupId,
    String lastDocId,
    String orderField,
    bool isDescending,
  });
}
