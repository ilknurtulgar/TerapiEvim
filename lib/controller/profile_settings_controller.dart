import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/drop_down_controller.dart';

import '../core/base/component/toast/toast.dart';
import '../core/managers/picker/picker_manager.dart';
import '../model/common/profile/birth_date_model.dart';
import '../model/common/profile/gender_model.dart';
import '../model/common/profile/name_model.dart';
import '../model/common/profile/password_model.dart';
import '../model/common/profile/phone_number_model.dart';
import '../product/enum/local_keys_enum.dart';
import '../service/profile/i_profile_settings_service.dart';
import '../service/profile/profile_settings_service.dart';
import 'base/base_controller.dart';

abstract class IProfileSettingsController extends DropDownController
    with BaseController {
  final PickerManager pickerManager = PickerManager.instance;

  @override
  void onInit() {
    service = ProfileSettingsService(vexaFireManager.networkManager);

    name = localManager.getStringValue(LocalManagerKeys.name);
    nameController.text = name;

    birthday = localManager.getStringValue(LocalManagerKeys.birthDate);
    birthdayController.text = birthday;

    gender = localManager.getStringValue(LocalManagerKeys.gender);
    genderController.text = gender;

    email = localManager.getStringValue(LocalManagerKeys.email);
    emailController.text = email;

    phoneNumber = localManager.getStringValue(LocalManagerKeys.phone);
    phoneNumberController.text = phoneNumber;

    imageUrl.value = localManager.getStringValue(LocalManagerKeys.imageUrl);

    if (imageUrl == '') imageUrl.value = 'https://cdn.icon-icons.com/icons2/2645/PNG/512/person_circle_icon_159926.png';

    super.onInit();
  }

  late final IProfileSettingsService service;

  RxString genders = "Seçiniz".obs;
  RxString pickedImagePath = "".obs;
  RxString imageUrl = "".obs;

  String name = '';
  String birthday = '';
  String gender = '';
  String email =
      ''; // updateEmail fonksiyonu yoktu fonksiyon gelince update edilecek
  String password = '';
  String phoneNumber = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> save() async {
    if (name != nameController.text.trim()) {
      final result =
          await service.updateName(NameModel(name: nameController.text.trim()));
      if (result == null) {
        await localManager.setStringValue(
            LocalManagerKeys.name, nameController.text.trim());
      }
    }

    if (birthday != birthdayController.text.trim()) {
      final result = await service.updateBirthDate(
          BirthDateModel(birthDate: birthdayController.text.trim()));
      if (result == null) {
        await localManager.setStringValue(
            LocalManagerKeys.birthDate, birthdayController.text.trim());
      }
    }

    if (gender != genders.trim()) {
      final result = await service
          .updateGender(GenderModel(gender: genderController.text.trim()));
      if (result == null) {
        await localManager.setStringValue(
            LocalManagerKeys.gender, genderController.text.trim());
      }
    }

    if (phoneNumber != phoneNumberController.text.trim()) {
      final result = await service.updatePhoneNumber(
          PhoneNumberModel(phone: phoneNumberController.text.trim()));
      if (result == null) {
        await localManager.setStringValue(
            LocalManagerKeys.phone, phoneNumberController.text.trim());
      }
    }

    if (password != passwordController.text.trim()) {
      final result = await service.updatePassword(
          PasswordModel(password: passwordController.text.trim()));
      if (result != null) {
        flutterErrorToast('Hata oluştu');
      }
    }
  }

  Future<void> pickImage() async {
    try {
      String? _pickedImage = await pickerManager.filePicker.pickImage();
      if (_pickedImage == null) {
        flutterErrorToast("Image is not picked");
      } else {
        pickedImagePath.value = _pickedImage;
        uploadImage();
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error pickImage',
      );
      rethrow;
    }
  }

  Future<void> uploadImage() async {
    try {
      if (pickedImagePath.isEmpty) return;
      final String? result =
          await service.uploadAvatarImage(pickedImagePath.value);
      if (result == null) {
        flutterErrorToast('Could not upload');
        throw Exception('Could not upload');
      }
      localManager.setStringValue(LocalManagerKeys.imageUrl, result);
      imageUrl.value = result;
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error uploadImage',
      );
      rethrow;
    }
  }
}
