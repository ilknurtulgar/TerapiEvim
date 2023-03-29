import '../crashlytics_manager.dart';
import 'interface/i_fire_response_model.dart';
import 'interface/i_network_model.dart';
import 'models/created_id_response.dart';

abstract class IFirestoreManager<E extends INetworkModel<E>?> {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;

  Future<CreatedIdResponse?> create({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docId,
    String? collectionPath2,
  });

  Future<bool> createWithDocId({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> value,
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
      readOrderedById<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String lastDocumentId,
    required String collectionPath,
    required String orderField,
    required String whereIsEqualTo,
    required String whereField,
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
