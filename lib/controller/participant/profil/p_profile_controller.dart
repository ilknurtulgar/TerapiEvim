import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/_participant/profile/p_profile_serice.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import '../../../service/_participant/profile/i_p_profile_service.dart';
import '../../base/base_controller.dart';

class PProfileController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() async {
    name = localManager.getStringValue(LocalManagerKeys.name);

    birthday = localManager.getStringValue(LocalManagerKeys.birthDate);

    imageUrl.value = localManager.getStringValue(LocalManagerKeys.imageUrl);

    if (imageUrl == '')
      imageUrl.value =
          'https://cdn.icon-icons.com/icons2/2645/PNG/512/person_circle_icon_159926.png';

    pProfileService = PProfileService(vexaFireManager.networkManager);

    final List<TCopingMethodModel?>? fetchedCopingMethods =
        await pProfileService.getMyViewedCopingMethods();

    if (fetchedCopingMethods != null) {
      listOfCopingMethods.addAll(fetchedCopingMethods);
    }

    final List<TActivityModel?>? fetchedActivities =
        await pProfileService.getMyJoinedActivities();

    if (fetchedActivities != null) {
      listOfActivities.addAll(fetchedActivities);
    }

    ///TODO bhz->gizem: getJoinedGroup value can be null, so it should be first checked before setting to myGroup
    myGroup.value = await pProfileService.getJoinedGroup(
        localManager.getStringValue(LocalManagerKeys.pJoinedGroupId));

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<TCopingMethodModel?> listOfCopingMethods = <TCopingMethodModel?>[].obs;

  RxList<TActivityModel?> listOfActivities = <TActivityModel?>[].obs;

  late IPProfileService pProfileService;

  Rx<TGroupModel?> myGroup = TGroupModel(name: "").obs;

  RxString imageUrl = "".obs;

  String name = '';

  String birthday = '';
}
