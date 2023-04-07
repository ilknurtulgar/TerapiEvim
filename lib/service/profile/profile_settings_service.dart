import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../core/base/service/base_service.dart';
import '../../core/constants/api_const.dart';
import '../../core/constants/utils/text_constants/error_text_const.dart';
import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../core/managers/firebase/firestore/models/empty_model.dart';
import '../../core/managers/firebase/storage/storage_manager.dart';
import '../../model/common/profile/about_me_model.dart';
import '../../model/common/profile/birth_date_model.dart';
import '../../model/common/profile/gender_model.dart';
import '../../model/common/profile/name_model.dart';
import '../../model/common/profile/password_model.dart';
import '../../model/common/profile/phone_number_model.dart';
import '../../model/common/profile/user_avatar_model.dart';
import 'i_profile_settings_service.dart';

class ProfileSettingsService extends IProfileSettingsService with BaseService {
  ProfileSettingsService(IFirestoreManager<ErrorModelCustom> manager)
      : super(manager);

  @override
  Future<String?> updateBirthDate(
    BirthDateModel birthdate,
  ) async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<BirthDateModel, EmptyModel>(
      collectionPath: APIConst.users,
      docId: userId!,
      data: birthdate,
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }

  @override
  Future<String?> updateGender(GenderModel gender) async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<GenderModel, EmptyModel>(
      collectionPath: APIConst.users,
      docId: userId!,
      data: gender,
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }

  @override
  Future<String?> updateName(NameModel name) async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<NameModel, EmptyModel>(
      collectionPath: APIConst.users,
      docId: userId!,
      data: name,
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }

  @override
  Future<String?> updatePhoneNumber(PhoneNumberModel phoneNumber) async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<PhoneNumberModel, EmptyModel>(
      collectionPath: APIConst.users,
      docId: userId!,
      data: phoneNumber,
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }

  @override
  Future<String?> updatePassword(PasswordModel password) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      if (firebaseAuth.currentUser == null) {
        throw Exception(ErrorConst.currentUserIsNull);
      }

      if (password.password == null) {
        throw Exception(ErrorConst.passwordIsNull);
      }

      await firebaseAuth.currentUser
          ?.updatePassword(password.password!)
          .catchError((onError) async {
        throw Exception(onError);
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String?> updateAboutMe(AboutMeModel aboutMe) async {
    if (userId == null) return 'UserId is null';

    final result = await manager.update<AboutMeModel, EmptyModel>(
      collectionPath: APIConst.users,
      docId: userId!,
      data: aboutMe,
    );
    if (result.error != null) {
      return result.error?.description;
    }
    return null;
  }

  Future<String?> uploadAvatarImage(String fileString) async {
    try {
      if (userId == null) {
        return null;
      }

      FirebaseStorageManager storageManager = FirebaseStorageManager.instance;

      final String? imageUrl = await storageManager.storage.uploadFile(
          folder: APIConst.storageImages,
          fileName: userId!,
          file: File(fileString));
      if (imageUrl == null) return null;

      await manager.update<UserAvatarModel, EmptyModel>(
        collectionPath: APIConst.users,
        docId: userId!,
        data: UserAvatarModel(imageUrl: imageUrl),
      );

      return imageUrl;
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error uploadAvatarImage',
      );
      return null;
    }
  }
}
