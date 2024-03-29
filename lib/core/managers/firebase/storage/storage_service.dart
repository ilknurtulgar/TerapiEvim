import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../base/service/base_service.dart';
import 'i_storage_service.dart';

class StorageService extends IStorageService with BaseService {
  StorageService();

  final FirebaseStorage storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String?> uploadFile({
    required String fileName,
    required String folder,
    required File file,
    String fileType = 'jpg',
  }) async {
    try {
      /// Set a reference
      final filePathRef = storageRef.child("$folder/$fileName.$fileType");

      /// Upload file
      await filePathRef.putFile(file);

      /// Get url of uploaded image
      final String urlPath = await filePathRef.getDownloadURL();

      return urlPath;
    } on FirebaseException catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'uploadFile from storage_service');
      return null;
    }
  }
}
