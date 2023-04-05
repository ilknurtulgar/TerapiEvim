import 'package:firebase_storage/firebase_storage.dart';

import 'i_storage_service.dart';
import 'storage_service.dart';

class FirebaseStorageManager {
  static FirebaseStorageManager? _instance;

  static FirebaseStorageManager get instance {
    return _instance ??= FirebaseStorageManager._init();
  }

  final IStorageService storage = StorageService();

  final storageRef = FirebaseStorage.instance.ref();

  FirebaseStorageManager._init();

}
