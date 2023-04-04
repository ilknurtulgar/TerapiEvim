import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';

import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/picker/picker_manager.dart';
import '../../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../../service/_therapist/coping_methods/i_t_coping_method_service.dart';
import '../../../../service/_therapist/coping_methods/t_coping_method_service.dart';
import '../../../base/base_controller.dart';

class TCopingMethodsController extends GetxController with BaseController {
  late final ITCopingMethodService copingMethodService;
  late BuildContext _context;

  @override
  void setContext(BuildContext context) => _context = context;

  @override
  void onInit() {
    copingMethodService = TCopingMethodService(vexaFireManager.networkManager);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final PickerManager pickerManager = PickerManager.instance;

  RxString pickedPdf = ''.obs;

  RxBool isLoading = false.obs;

  Future<void> pickPdf() async {
    try {
      String? _pickedPdf = await pickerManager.filePicker.pickPdf();
      if (_pickedPdf == null ) {
        flutterErrorToast("Pdf is not picked");
      } else {
        pickedPdf.value = _pickedPdf;
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
      if (pickedPdf == null) return;
      final NavigatorState navigator = Navigator.of(_context);
      final NavigationManager navigationManager = NavigationManager.instance;

      final TCopingMethodModel copingMethod = TCopingMethodModel(
        description: '',
        dateTime: Timestamp.fromDate(DateTime.now()),
        docUrl: '',
        therapistAvatarUrl: '',
        therapistName: '',
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
