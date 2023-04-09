import 'dart:io';

import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../core/managers/firebase/storage/storage_manager.dart';
import '../../../model/therapist/confirmation/t_confirmation_model.dart';
import 'i_t_confirmation_service.dart';

class TConfirmationService extends ITConfirmationService with BaseService {
  TConfirmationService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<CreatedIdResponse?> uploadConfirmation(
      ConfirmationModel confirmation) async {
    try {
      if (userId == null) return null;

      if (confirmation.pickedPdfPath == null) {
        throw Exception('confirmation.pickedPdfPath == null');
      }

      final String? uploadedPdfUrl =
          await _uploadPdf(confirmation.pickedPdfPath!);

      if (uploadedPdfUrl == null) {
        throw Exception('could not upload pdf of confirmation');
      }

      /// Set id of a current therapist
      confirmation.therapistId = userId;
      confirmation.uploadedPdfUrl = uploadedPdfUrl;

      final CreatedIdResponse? createdIdResponse = await manager.create(
        collectionPath: APIConst.tConfirmation,
        data: confirmation.toJson()!,
      );

      if (createdIdResponse != null) {
        return createdIdResponse;
      }

      return null;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'uploadConfirmation');
      rethrow;
    }
  }

  Future<String?> _uploadPdf(String pdfPath) async {
    try {
      if (userId == null) return null;

      FirebaseStorageManager storageManager = FirebaseStorageManager.instance;

      final String? fileUrl = await storageManager.storage.uploadFile(
        folder: APIConst.storageTConfirmation,
        fileName: "${userId!}_${DateTime.now().millisecondsSinceEpoch}",
        file: File(pdfPath),
        fileType: AppConst.pdf,
      );

      return fileUrl;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'uploadPdf at t_coping_method');
      rethrow;
    }
  }
}
