import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';

abstract class ITCopingMethodService {
  ITCopingMethodService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an copingMethod was not added
  Future<CreatedIdResponse?> createCopingMethod(
      TCopingMethodModel copingMethod);

  Future<String?> uploadPdf(String pdfPath);

  Future<String?> updateCopingMethod(TCopingMethodModel copingMethod);

  Future<TCopingMethodModel?> getCopingMethodById(String copingMethodId);

  Future<List<TCopingMethodModel?>?> getCopingMethodsOrdered(
      {String lastDocId, String orderField, bool isDescending});

  Future<String?> deleteCopingMethod(String copingMethodId);
}
