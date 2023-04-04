import 'dart:io';

abstract class IStorageService {
  Future<String?> uploadImage({
    required String userId,
    required File file,
    String fileType,
  });
}
