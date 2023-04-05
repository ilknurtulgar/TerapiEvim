import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';

import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/picker/picker_manager.dart';
import '../../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../../product/enum/local_keys_enum.dart';
import '../../../../service/_therapist/coping_methods/i_t_coping_method_service.dart';
import '../../../../service/_therapist/coping_methods/t_coping_method_service.dart';
import '../../../base/base_controller.dart';

class TCopingMethodsController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) => _context = context;

  void setCurrentGroupId(String groupId) => _currentGroupId = groupId;

  @override
  void onInit() {
    copingMethodService = TCopingMethodService(vexaFireManager.networkManager);
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    descriptionController.dispose();

    super.dispose();
  }

  late final ITCopingMethodService copingMethodService;

  late BuildContext _context;

  late TextEditingController descriptionController;

  final PickerManager pickerManager = PickerManager.instance;

  RxString pickedPdfPath = ''.obs;

  String _currentGroupId = '';

  RxBool isLoading = false.obs;

  Future<void> pickPdf() async {
    try {
      String? _pickedPdf = await pickerManager.filePicker.pickPdf();
      if (_pickedPdf == null) {
        flutterErrorToast("Pdf is not picked");
      } else {
        pickedPdfPath.value = _pickedPdf;
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error pickPdf',
      );
      rethrow;
    }
  }

  Future<void> shareCopingMethod() async {
    try {
      if (pickedPdfPath.value.isEmpty) return;

      final NavigatorState navigator = Navigator.of(_context);
      final NavigationManager navigationManager = NavigationManager.instance;

      final String? pdfUrl =
          await copingMethodService.uploadPdf(pickedPdfPath.value);

      if (pdfUrl == null) {
        throw Exception('pdfUrl is null');
      }

      final String therapistName =
          localManager.getStringValue(LocalManagerKeys.name);
      final String imageUrl =
          localManager.getStringValue(LocalManagerKeys.imageUrl);

      final TCopingMethodModel copingMethod = TCopingMethodModel(
        groupId: _currentGroupId,
        description: descriptionController.text.trim(),
        dateTime: Timestamp.fromDate(DateTime.now()),
        docUrl: pdfUrl,
        therapistAvatarUrl: imageUrl,
        therapistName: therapistName,
      );

      final CreatedIdResponse? createdIdResponse =
          await copingMethodService.createCopingMethod(copingMethod);

      if (createdIdResponse != null) {
        navigationManager.maybePop(navigator);
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error shareCopingMethod',
      );
      rethrow;
    }
  }
}
