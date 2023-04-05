import 'dart:io';

import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/init/network/model/error_model_custom.dart';
import '../../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../../core/managers/firebase/storage/storage_manager.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import 'i_t_coping_method_service.dart';

class TCopingMethodService extends ITCopingMethodService with BaseService {
  TCopingMethodService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<CreatedIdResponse?> createCopingMethod(
      TCopingMethodModel copingMethod) async {
    if (userId == null) return null;

    copingMethod.therapistId = userId;

    final CreatedIdResponse? createdIdResponse = await manager.create(
      collectionPath: APIConst.copingMethods,
      data: copingMethod.toJson()!,
    );

    if (createdIdResponse != null) {
      return createdIdResponse;
    }

    return null;
  }

  @override
  Future<String?> uploadPdf(String pdfPath) async {
    try {
      if (userId == null) return null;

      FirebaseStorageManager storageManager = FirebaseStorageManager.instance;

      final String? fileUrl = await storageManager.storage.uploadFile(
        folder: APIConst.storageCopingMethods,
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

  @override
  Future<String?> updateCopingMethod(TCopingMethodModel copingMethod) async {
    if (userId == null) return null;
    final result = await manager.update<TCopingMethodModel, EmptyModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.copingMethods,
      docId2: copingMethod.id,
      data: copingMethod,
    );
    if (result.error != null) {
      return result.error?.description;
    }

    return null;
  }

  @override
  Future<TCopingMethodModel?> getCopingMethodById(String copingMethodId) async {
    if (userId == null) return null;

    final result =
        await manager.readOne<TCopingMethodModel, TCopingMethodModel>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.copingMethods,
      docId2: copingMethodId,
      parseModel: TCopingMethodModel(),
    );
    if (result.error != null) {
      return null;
    }

    return result.data;
  }

  @override
  Future<List<TCopingMethodModel?>?> getCopingMethodsOrdered({
    String lastDocId = '',
    String orderField = AppConst.dateTime,
    bool isDescending = false,
  }) async {
    if (userId == null) return null;

    final result =
        await manager.readOrdered<TCopingMethodModel, List<TCopingMethodModel>>(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.copingMethods,
      parseModel: TCopingMethodModel(),
      isDescending: isDescending,
      orderField: orderField,
      lastDocumentId: lastDocId,
    );
    if (result.error != null) {
      return [];
    }

    return result.data;
  }

  @override
  Future<String?> deleteCopingMethod(String copingMethodId) async {
    if (userId == null) return null;

    final result = await manager.delete(
      collectionPath: APIConst.therapist,
      docId: userId!,
      collectionPath2: APIConst.copingMethods,
      docId2: copingMethodId,
    );
    if (result == false) {
      return "ERROR";
    }
    return null;
  }
}
