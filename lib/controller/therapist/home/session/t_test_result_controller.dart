import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../controller/base/base_controller_2.dart';
import '../../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../../model/therapist/session/t_session_model.dart';
import '../../../../service/_therapist/scl_90/i_t_scl_90_service.dart';
import '../../../../service/_therapist/scl_90/t_scl_90_service.dart';

class TTestResultController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  Future<void> setSessionModel(TSessionModel sessionModel) async {
    session = sessionModel;
    result.value = await sessionService.getSCLResultById(
        participantId: session.participantId ?? "");
  }

  @override
  void onInit() async {
    sessionService = TScl90Service(vexaFireManager.networkManager);
    super.onInit();
  }

  late ITScl90Service sessionService;

  Rx<Scl90ResultModel?> result = Scl90ResultModel().obs;

  late TSessionModel session;
}
