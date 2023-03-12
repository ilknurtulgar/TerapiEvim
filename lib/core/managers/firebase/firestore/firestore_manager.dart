import 'package:cloud_firestore/cloud_firestore.dart';
import 'i_firestore_manager.dart';
import 'interface/i_fire_response_model.dart';
import 'interface/i_network_model.dart';
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
  Future<bool> create({
    required String collectionPath,
    required Map<String, dynamic> value,
  }) async {
    try {
      await _database.collection(collectionPath).add(value);
      return true;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at firestore_manager/create');
      return false;
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
  Future<bool> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<IResponseModel<R?, E?>> read<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    required String docId,
  }) async {
    try {
      final DocumentSnapshot response =
          await _database.collection(collectionPath).doc(docId).get();
      if (response.data() == null) {
        throw Exception();
      }
      final data = response.data() as Map<String, dynamic>;

      return _getResponseResult<T, R>(data, parseModel);
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return _onError(e);
    }
  }

  ResponseModel<R, E> _getResponseResult<T extends INetworkModel, R>(
      dynamic data, T parserModel) {
    final model = _parseBody<R, T>(data, parserModel,true);

    return ResponseModel<R, E>(data: model);
  }

  ///TODO: finish _onError implementation
  ResponseModel<R, E> _onError<R>(Object e) {
    final errorResponse = e.toString();
    CustomLogger(
        isEnabled: isLoggerEnabled ?? false, data: errorResponse);
    var error = ErrorModel<E>(description: errorResponse, statusCode: null);
    return ResponseModel<R, E>(
        error: ErrorModel<E>(
            description: error.description, statusCode: error.statusCode));
  }

  @override
  Future<bool> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
