import 'package:flutter/material.dart';

import '../../../../core/base/component/toast/toast.dart';
import '../../../../model/common/group/group_category_model.dart';
import '../../../../model/therapist/session/t_session_model.dart';
import '../../../../screen/therapist/home/t_session_view.dart';
import '../../../../service/_therapist/scl_90/i_t_scl_90_service.dart';
import '../../../../service/_therapist/scl_90/t_scl_90_service.dart';
import '../../../base/base_controller_2.dart';

class TChooseCategoryController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    tSessionService = TScl90Service(vexaFireManager.networkManager);

    super.onInit();
  }

  late ITScl90Service tSessionService;

  void setSessionModel(TSessionModel sessionModel) => session = sessionModel;

  late TSessionModel session;

  String currentCategory = '';

  Future<void> setCategory() async {
    try {
      if (currentCategory.isEmpty) {
        flutterErrorToast("Category is not selected");
        return;
      }
      final GroupCategoryModel groupCategory = GroupCategoryModel(
        participantId: session.participantId!,
        groupCategory: currentCategory,
      );
      final NavigatorState navigator = Navigator.of(controllerContext);

      final bool result = await tSessionService.setParticipantToACategory(
          groupCategory: groupCategory, session: session);

      if (result == false) {
        flutterErrorToast("Could not set a category");
        return;
      }
      navigationManager.pushAndRemoveUntil(navigator, TSessionView());
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error setCategory',
      );
      rethrow;
    }
  }
}
