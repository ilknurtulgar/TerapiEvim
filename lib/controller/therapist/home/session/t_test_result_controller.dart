import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller_2.dart';
import 'package:terapievim/core/init/cache/local_manager.dart';
import '../../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../../model/therapist/session/t_session_model.dart';
import '../../../../service/_therapist/scl_90/i_t_scl_90_service.dart';
import '../../../../service/_therapist/scl_90/t_scl_90_service.dart';

class TTestResultController extends BaseController2{
  @override
  void setContext(BuildContext context) => controllerContext = context;
  
  void setSessionModel(TSessionModel sessionModel) => session = sessionModel;

  @override 
  void onInit() async {
    tSessionService = TScl90Service(vexaFireManager.networkManager);

    result.value = await tSessionService.getSCLResultById(participantId: session.participantId ?? "");
    
    super.onInit();
  }

  late ITScl90Service tSessionService;

  Rx<Scl90ResultModel?> result = Scl90ResultModel().obs;

  late TSessionModel session;
  
}