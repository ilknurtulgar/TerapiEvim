import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller_2.dart';
import 'package:terapievim/model/therapist/confirmation/t_confirmation_model.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/managers/picker/picker_manager.dart';
import '../../../service/_therapist/confirmation/t_confirmation_service.dart';
import '../therapist_controller.dart';

class TUploadedController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }

  @override
  void onInit() {
    therapistController = Get.find();
    service = TConfirmationService(vexaFireManager.networkManager);
    super.onInit();
  }

  late TConfirmationService service;

  late TherapistController therapistController;
  bool changeIsTherapistLoaded() {
    therapistController.isDiplomaUploaded.value = true;
    therapistController.isTherapistConfirmed.value =
        true; //direkt confirm edilmis olsun
    if (pickedPdfPath.isEmpty) {
      return false;
    } else {
      ConfirmationModel model = ConfirmationModel(
          therapistId: userId,
          isConfirmed: true,
          pickedPdfPath: pickedPdfPath.value);
      service.uploadConfirmation(model);
      therapistController.isTherapistConfirmed.value = true;
      return true;
    }
  }

  final PickerManager pickerManager = PickerManager.instance;

  RxString pickedPdfPath = ''.obs;
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
}
