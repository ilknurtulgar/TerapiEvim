import 'package:cloud_firestore/cloud_firestore.dart';

import 'i_firestore_manager.dart';

class FirestoreManager extends IFirestoreManager {
  static FirestoreManager? _instance;

  static FirestoreManager get instance {
    return _instance ??= FirestoreManager._init();
  }

  FirestoreManager._init();

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  @override
  Future<bool> create({
    required String collectionPath,
    required Map<String, dynamic> value,
  }) async {
    await _database.collection(collectionPath).add(value);

    return true;
  }

  @override
  Future<bool> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
