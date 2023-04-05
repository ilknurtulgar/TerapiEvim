import 'dart:io';

abstract class IStorageService {
  Future<String?> uploadFile({
    required String fileName,
    required String folder,
    required File file,
    String fileType,
  });
}
