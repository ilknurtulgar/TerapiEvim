import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller_2.dart';
import 'package:terapievim/model/therapist/group/t_about_group_model.dart';
import 'package:terapievim/service/_therapist/group/t_group_service.dart';

import '../../../service/_therapist/group/i_t_group_service.dart';

class TAboutTherapistController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }

  Future<void> setGroupId(String id) async {
    groupId = id;

    TAboutGroupModel? fetched =
        await tGroupService.getAboutTherapistHelper(groupId);
    if (fetched != null) {
      tModel.value = fetched;
    }
  }

  late String groupId;
  late ITGroupService tGroupService;
  Rx<TAboutGroupModel> tModel = TAboutGroupModel().obs;
  @override
  Future<void> onInit() async {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    super.onInit();
  }

  //yapilmadi
  //terapistin bilgielero alinmali
}
