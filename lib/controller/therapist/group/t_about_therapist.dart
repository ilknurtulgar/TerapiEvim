import 'package:flutter/src/widgets/framework.dart';
import 'package:terapievim/controller/base/base_controller_2.dart';
import 'package:terapievim/model/therapist/group/t_about_group_model.dart';
import 'package:terapievim/service/_therapist/group/t_group_service.dart';

class TAboutTherapistController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }

  Future<void> setGroupId(String id) async {
    groupId = id;
    tModel = await tGroupService.getAboutTherapistHelper(groupId);
  }

  late String groupId;
  late TGroupService tGroupService;
  TAboutGroupModel? tModel;
  @override
  Future<void> onInit() async {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    super.onInit();
  }

  //yapilmadi
  //terapistin bilgielero alinmali
}
