import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../model/therapist/confirmation/t_confirmation_model.dart';

abstract class ITConfirmationService {
  ITConfirmationService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  /// Note: pickedPdfPath should not be null
  Future<CreatedIdResponse?> uploadConfirmation(ConfirmationModel confirmation);
}
