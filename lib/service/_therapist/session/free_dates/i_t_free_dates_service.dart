import '../../../../core/init/network/model/error_model_custom.dart';
import '../../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../model/therapist/session/free_date/t_free_date_model.dart';

abstract class ITFreeDateService {
  ITFreeDateService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// if result is null, it means an session was not added
  Future<CreatedIdResponse?> createFreeDate(TFreeDateModel freeDate);

  // Future<String?> updateFreeDate(TFreeDateModel freeDate);

  Future<TFreeDateModel?> getFreeDateById(String freeDate);

  Future<List<TFreeDateModel?>> getMyFreeDatesOrdered(
      {String lastDocId, String orderField, bool isDescending});

  // Future<String?> deleteFreeDate(String freeDate);
}
