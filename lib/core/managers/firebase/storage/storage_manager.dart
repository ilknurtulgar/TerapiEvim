import 'i_storage_service.dart';
import 'storage_service.dart';

class FirebaseStorageManager {
  static FirebaseStorageManager? _instance;

  static FirebaseStorageManager get instance {
    return _instance ??= FirebaseStorageManager._init();
  }

  final IStorageService storage = StorageService();

  FirebaseStorageManager._init();

}
