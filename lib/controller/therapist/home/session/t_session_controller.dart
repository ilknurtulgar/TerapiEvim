import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/therapist/session/t_session_model.dart';
import 'package:terapievim/service/_therapist/session/t_session_service.dart';

import '../../../drop_down_controller.dart';

class TSessionController extends DropDownController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    tSessionService = TSessionService(vexaFireManager.networkManager);
    List<TSessionModel?> sessions = await tSessionService.getSessionsOrdered();
    fetchedSession.addAll(sessions);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late TSessionService tSessionService;

  RxList<TSessionModel?> fetchedSession = <TSessionModel?>[].obs;
}
