import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/profile/about_me_model.dart';
import '../../model/common/profile/birth_date_model.dart';
import '../../model/common/profile/gender_model.dart';
import '../../model/common/profile/name_model.dart';
import '../../model/common/profile/password_model.dart';
import '../../model/common/profile/phone_number_model.dart';

abstract class IProfileSettingsService {
  /// return type of null means success
  /// but if String is returned, it means an error
  /// has occurred, and description is in String

  IProfileSettingsService(this.manager);

  final IFirestoreManager<ErrorModelCustom> manager;

  Future<String?> updateName(NameModel name);

  Future<String?> updateBirthDate(BirthDateModel birthdate);

  Future<String?> updateGender(GenderModel gender);

  Future<String?> updatePhoneNumber(PhoneNumberModel phoneNumber);

  Future<String?> updatePassword(PasswordModel password);

  Future<String?> updateAboutMe(AboutMeModel aboutMe);
}
