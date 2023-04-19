import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import '../../../service/_therapist/profile/i_t_profile_service.dart';
import '../../../service/_therapist/profile/t_profile_serice.dart';
import '../../base/base_controller.dart';

class TProfileController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    tProfileService = TProfileService(vexaFireManager.networkManager);

    name = localManager.getStringValue(LocalManagerKeys.name);

    aboutMe.value = localManager.getStringValue(LocalManagerKeys.aboutMe);

    birthday = localManager.getStringValue(LocalManagerKeys.birthDate);

    imageUrl.value = localManager.getStringValue(LocalManagerKeys.imageUrl);

    if (imageUrl == '') imageUrl.value = 'https://cdn.icon-icons.com/icons2/2645/PNG/512/person_circle_icon_159926.png';

    final List<TCopingMethodModel?>? fetchedCopingMethods =
        await tProfileService.getCopingMethodsOrdered();

    if (fetchedCopingMethods != null) {
      listOfCopingMethods.addAll(fetchedCopingMethods);
    }

    final List<TActivityModel?>? fetchedActivities =
        await tProfileService.getMyPastActivitiesOrdered();

    if (fetchedActivities != null) {
      listOfActivities.addAll(fetchedActivities);
    }

    final List<TGroupModel?>? fetchedGroups =
        await tProfileService.getGroupsOrdered();

    if (fetchedGroups != null) {
      listOfGroups.addAll(fetchedGroups);
    }

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<TCopingMethodModel?> listOfCopingMethods = <TCopingMethodModel?>[].obs;

  RxList<TGroupModel?> listOfGroups = <TGroupModel?>[].obs;

  RxList<TActivityModel?> listOfActivities = <TActivityModel?>[].obs;

  late ITProfileService tProfileService;

  RxString imageUrl = "".obs;

  RxString aboutMe = "".obs;

  String name = '';

  String birthday = '';
}
