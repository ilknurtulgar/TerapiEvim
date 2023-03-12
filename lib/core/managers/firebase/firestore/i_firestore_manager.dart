import '../crashlytics_manager.dart';
import 'interface/i_fire_response_model.dart';
import 'interface/i_network_model.dart';

abstract class IFirestoreManager<E extends INetworkModel<E>?> {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;

  Future<bool> create({
    required String collectionPath,
    required Map<String, dynamic> value,
  });

  Future<bool> createWithDocId({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> value,
  });

  Future<IResponseModel<R?, E?>> read<T extends INetworkModel<T>, R>({
    required T parseModel,
    required String collectionPath,
    required String docId,
  });

  Future<bool> update();

  Future<bool> delete();
}
