abstract class IFirestoreManager {
  Future<bool> create({
    required String collectionPath,
    required Map<String, dynamic> value,
  });

  Future<bool> read();

  Future<bool> update();

  Future<bool> delete();
}
