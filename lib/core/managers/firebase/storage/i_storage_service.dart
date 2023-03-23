import 'dart:io';

abstract class IStorageService {
  Future<String?> uploadAvatarImage({
    required String userId,
    required File file,
    String fileType = 'jpg',
  });
}
