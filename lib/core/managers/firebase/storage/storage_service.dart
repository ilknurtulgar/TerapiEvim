import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../base/service/base_service.dart';
import '../../../constants/api_const.dart';
import 'i_storage_service.dart';

class StorageService extends IStorageService with BaseService {
  StorageService();

  final FirebaseStorage storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String?> uploadAvatarImage({
    required String userId,
    required File file,
    String fileType = 'jpg',
  }) async {
    try {
      /// Set a reference
      final userAvatarRef =
          storageRef.child("${APIConst.storageImages}/$userId.$fileType");

      /// Upload file
      await userAvatarRef.putFile(file);

      /// Get url of uploaded image
      final String urlPath = await userAvatarRef.getDownloadURL();

      return urlPath;
    } on FirebaseException catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return null;
    }
  }
}
