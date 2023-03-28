import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/app_const.dart';
import 'i_firestore_manager.dart';
import 'interface/i_fire_response_model.dart';
import 'interface/i_network_model.dart';
import 'models/created_id_response.dart';
import 'models/empty_model.dart';
import 'models/error_model.dart';
import 'models/response_model.dart';
import 'utility/custom_logger.dart';

part 'operation/network_model_parser.dart';

class FirestoreManager<E extends INetworkModel<E>?>
    extends IFirestoreManager<E> {
  FirestoreManager({
    this.isLoggerEnabled,
    this.errorModel,
  });

  final bool? isLoggerEnabled;

  /// [INetworkModel?] is response model for every request.
  ///
  /// Example:
  /// [LoginModel()]
  E? errorModel;

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Future<CreatedIdResponse?> create({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? docId,
    String? collectionPath2,
  }) async {
    CreatedIdResponse? createdIdResponse;
    DocumentReference? documentReference;

    try {
      if (collectionPath2 != null) {
        documentReference = _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .doc();
      } else {
        documentReference = _database.collection(collectionPath).doc();
      }
      data[AppConst.id] = documentReference.id;

      await documentReference.set(data);

      createdIdResponse = CreatedIdResponse(id: documentReference.id);

      return createdIdResponse;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at firestore_manager/create');
      return null;
    }
  }

  @override
  Future<bool> createWithDocId(
      {required String collectionPath,
      required String docId,
      required Map<String, dynamic> value}) async {
    try {
      await _database.collection(collectionPath).doc(docId).set(value);
      return true;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at firestore_manager/createWithDocId');
      return false;
    }
  }

  @override
  Future<IResponseModel<R?, E?>> readOne<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
  }) async {
    DocumentSnapshot? response;
    try {
      if (collectionPath2 != null && docId2 != null) {
        response = await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .doc(docId2)
            .get();
      } else {
        response = await _database.collection(collectionPath).doc(docId).get();
      }

      if (response.data() == null) {
        throw Exception("response.data() is null in firestoreManager");
      }
      final data = response.data() as Map<String, dynamic>;

      return _getResponseResult<T, R>(data, parseModel);
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return _onError(e);
    }
  }

  @override
  Future<IResponseModel<R?, E?>> readOrdered<T extends INetworkModel<T>, R>({
    required String collectionPath,
    String? collectionPath2,
    String? docId,
    required String orderField,
    required T parseModel,
    required String lastDocumentId,
    int limit = AppConst.tenItemsPerPage,
    bool isDescending = false,
  }) async {
    QuerySnapshot? response;
    DocumentSnapshot<Map<String, dynamic>>? docSnapshot;
    try {
      if (lastDocumentId.isNotEmpty) {
        /// Creates a path which checks if it is nested
        final String collectionPathString = collectionPath2 != null
            ? '$collectionPath/${'$docId/$collectionPath2/'}$lastDocumentId'
            : '$collectionPath/$lastDocumentId';

        docSnapshot = await _database.doc(collectionPathString).get();
      }

      /// return paginated items
      if (collectionPath2 != null && lastDocumentId.isNotEmpty) {
        response = await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .orderBy(orderField, descending: isDescending)
            .startAfterDocument(docSnapshot!)
            .limit(limit)
            .get();
      } else if (lastDocumentId.isNotEmpty) {
        response = await _database
            .collection(collectionPath)
            .orderBy(orderField, descending: isDescending)
            .startAfterDocument(docSnapshot!)
            .limit(limit)
            .get();
      }

      ///This code is executed if lastDocumentId is not provided
      if (collectionPath2 != null && lastDocumentId.isEmpty) {
        response = await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .orderBy(orderField, descending: isDescending)
            .limit(limit)
            .get();
      } else if (lastDocumentId.isEmpty) {
        response = await _database
            .collection(collectionPath)
            .orderBy(orderField, descending: isDescending)
            .limit(limit)
            .get();
      }

      final List<QueryDocumentSnapshot<Object?>>? queryList = response?.docs;

      return _getResponseResult<T, R>(queryList, parseModel);
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return _onError(e);
    }
  }

  @override
  Future<IResponseModel<R?, E?>>
      readOrderedById<T extends INetworkModel<T>, R>({
    required String collectionPath,
    required String whereIsEqualTo,
    required String whereField,
    required String orderField,
    required T parseModel,
    required String lastDocumentId,
    String? collectionPath2,
    String? docId,
    int limit = AppConst.tenItemsPerPage,
    bool isDescending = false,
  }) async {
    QuerySnapshot? response;
    DocumentSnapshot<Map<String, dynamic>>? docSnapshot;
    try {
      if (lastDocumentId.isNotEmpty) {
        /// Creates a path which checks if it is nested
        final String collectionPathString = collectionPath2 != null
            ? '$collectionPath/${'$docId/$collectionPath2/'}$lastDocumentId'
            : '$collectionPath/$lastDocumentId';

        docSnapshot = await _database.doc(collectionPathString).get();
      }

      /// return paginated items
      if (collectionPath2 != null && lastDocumentId.isNotEmpty) {
        response = await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .where(whereField, isEqualTo: whereIsEqualTo)
            .orderBy(orderField, descending: isDescending)
            .startAfterDocument(docSnapshot!)
            .limit(limit)
            .get();
      } else if (lastDocumentId.isNotEmpty) {
        response = await _database
            .collection(collectionPath)
            .where(whereField, isEqualTo: whereIsEqualTo)
            .orderBy(orderField, descending: isDescending)
            .startAfterDocument(docSnapshot!)
            .limit(limit)
            .get();
      }

      ///This code is executed if lastDocumentId is not provided
      if (collectionPath2 != null && lastDocumentId.isEmpty) {
        response = await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .where(whereField, isEqualTo: whereIsEqualTo)
            .orderBy(orderField, descending: isDescending)
            .limit(limit)
            .get();
      } else if (lastDocumentId.isEmpty) {
        response = await _database
            .collection(collectionPath)
            .where(whereField, isEqualTo: whereIsEqualTo)
            .orderBy(orderField, descending: isDescending)
            .limit(limit)
            .get();
      }

      final List<QueryDocumentSnapshot<Object?>>? queryList = response?.docs;

      return _getResponseResult<T, R>(queryList, parseModel);
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return _onError(e);
    }
  }

  @override
  Future<IResponseModel<R?, E?>> update<T extends INetworkModel<T>, R>({
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
    required T data,
  }) async {
    try {
      if (data.toJson() == null) {
        return ResponseModel<R, E>(
            error: ErrorModel(description: "data is empty"));
      }

      if (collectionPath2 != null && docId2 != null) {
        await _database
            .collection(collectionPath)
            .doc(docId)
            .collection(collectionPath2)
            .doc(docId2)
            .update(data.toJson()!);
      } else {
        await _database
            .collection(collectionPath)
            .doc(docId)
            .update(data.toJson()!);
      }

      return ResponseModel<R, E>();
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return ResponseModel<R, E>(error: ErrorModel(description: e.toString()));
    }
  }

  @override
  Future<bool> delete({
    required String collectionPath,
    required String docId,
    String? collectionPath2,
    String? docId2,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  ResponseModel<R, E> _getResponseResult<T extends INetworkModel, R>(
      dynamic data, T parserModel) {
    final model = _parseBody<R, T>(data, parserModel, true);

    return ResponseModel<R, E>(data: model);
  }

  ///TODO: finish _onError implementation
  ResponseModel<R, E> _onError<R>(Object e) {
    final errorResponse = e.toString();
    CustomLogger(isEnabled: isLoggerEnabled ?? false, data: errorResponse);
    var error = ErrorModel<E>(description: errorResponse, statusCode: null);
    return ResponseModel<R, E>(
        error: ErrorModel<E>(
            description: error.description, statusCode: error.statusCode));
  }
}
