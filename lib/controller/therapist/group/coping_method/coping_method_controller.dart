import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/component/toast/toast.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../../core/managers/firebase/firestore/models/created_id_response.dart';
import '../../../../core/managers/picker/picker_manager.dart';
import '../../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../../model/therapist/group/t_group_model.dart';
import '../../../../product/enum/local_keys_enum.dart';
import '../../../../service/_therapist/coping_methods/i_t_coping_method_service.dart';
import '../../../../service/_therapist/coping_methods/t_coping_method_service.dart';
import '../../../../service/_therapist/group/i_t_group_service.dart';
import '../../../../service/_therapist/group/t_group_service.dart';
import '../../../base/base_controller.dart';

class TCopingMethodsController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) => _context = context;

  void setCurrentGroupId(String groupId) => _currentGroupId = groupId;

  @override
  Future<void> onInit() async {
    titleController = TextEditingController();

    descriptionController = TextEditingController();

    _copingMethodService = TCopingMethodService(vexaFireManager.networkManager);

    _groupService = TGroupService(vexaFireManager.networkManager);

    await _fetchOtherGroups();

    super.onInit();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  late final ITCopingMethodService _copingMethodService;

  late final ITGroupService _groupService;

  late BuildContext _context;

  late TextEditingController descriptionController;
  late TextEditingController titleController;

  final PickerManager pickerManager = PickerManager.instance;

  RxString pickedPdfPath = ''.obs;

  String _currentGroupId = '';

  RxBool isLoading = false.obs;

  RxList<TGroupModel?> otherGroups = <TGroupModel?>[].obs;

  List<String> selectedGroupIds = [];

  List<String> createdCopingMethodIds = [];

  ///TODO: there is an issue: length of 10 shouldn't be const. Yes it was for demo purpose
  ///TODO Now it should be updated to handle real groups
  List<bool> isButtonOn = List<bool>.filled(10, false).obs;

  void switchButtonFunction(int index, bool value) {
    isButtonOn[index] = value;
    if (otherGroups[index]?.id != null) {
      onGroupSelected(otherGroups[index]!.id!);
    }
  }

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

      isLoading.value = true;

      final String? pdfUrl =
          await _copingMethodService.uploadPdf(pickedPdfPath.value);
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
          await _copingMethodService.createCopingMethod(copingMethod);
      if (createdIdResponse == null) {
        throw Exception("Created createdIdResponse is null in first step");
      }

      createdCopingMethodIds.add(createdIdResponse.id!);

      /// Multi upload of coping method to other groups
      for (String groupId in selectedGroupIds) {
        copingMethod.groupId = groupId;
        final CreatedIdResponse? createdIdResponse =
            await _copingMethodService.createCopingMethod(copingMethod);

        if (createdIdResponse != null) {
          createdCopingMethodIds.add(createdIdResponse.id!);
        }
      }
      isLoading.value = false;

      navigationManager.maybePop(navigator);
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error shareCopingMethod',
      );
      isLoading.value = false;
    }
  }

  Future<void> _fetchOtherGroups() async {
    try {
      final List<TGroupModel?> fetchedGroups =
          await _groupService.getGroupsOrdered();

      if (fetchedGroups.isEmpty) return;

      otherGroups.addAll(fetchedGroups);

      otherGroups.removeWhere((element) => element!.id == _currentGroupId);
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error fetchOtherGroups',
      );
      rethrow;
    }
  }

  void onGroupSelected(String groupId) {
    if (selectedGroupIds.contains(groupId) == false) {
      selectedGroupIds.add(groupId);
    } else {
      selectedGroupIds.removeWhere((element) => element == groupId);
    }
  }
}
