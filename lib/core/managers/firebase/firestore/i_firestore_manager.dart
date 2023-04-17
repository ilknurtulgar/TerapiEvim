import '../crashlytics_manager.dart';
import 'interface/i_fire_response_model.dart';
import 'interface/i_network_model.dart';
import 'models/created_id_response.dart';

abstract class IFirestoreManager<E extends INetworkModel<E>?> {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;

  Future<String> createAUniqueId({required String collectionPath});

  Future<CreatedIdResponse?> create({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docId,
    String? collectionPath2,
  });

  /// True is success
  Future<bool> createWithDocId({
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
    required Map<String, dynamic> data,
  });

  Future<IResponseModel<R?, E?>> read<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    String? docId,
    int limit,
    String? collectionPath2,
  });

  Future<IResponseModel<R?, E?>> readWhere<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    required String whereField,
    required Object whereIsEqualTo,
    String? docId,
    int limit,
    String? collectionPath2,
  });

  Future<IResponseModel<R?, E?>> readOne<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
  });

  Future<IResponseModel<R?, E?>> readOrdered<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String lastDocumentId,
    required String collectionPath,
    required String orderField,
    String? docId,
    int limit,
    bool isDescending,
    String? collectionPath2,
  });

  Future<IResponseModel<R?, E?>>
      readOrderedWhere2<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String lastDocumentId,
    required String collectionPath,
    required String orderField,
    required String whereField,
    required Object whereIsEqualTo,
    required String whereField2,
    required Object whereIsEqualTo2,
    String? docId,
    int limit,
    bool isDescending,
    String? collectionPath2,
  });

  Future<IResponseModel<R?, E?>>
      readOrderedWhere<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String lastDocumentId,
    required String collectionPath,
    required String orderField,
    required String whereField,
    required Object whereIsEqualTo,
    String? docId,
    int limit,
    bool isDescending,
    String? collectionPath2,
  });

  Future<IResponseModel<R?, E?>> update<T extends INetworkModel<T>, R>({
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
    required T data,
  });

  Future<bool> delete({
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
  });
}
