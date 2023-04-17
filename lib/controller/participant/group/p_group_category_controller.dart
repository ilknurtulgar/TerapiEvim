import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/model/therapist/group/t_group_model.dart';
import 'package:terapievim/service/_participant/group/t_group_service.dart';

import '../../../service/_participant/group/i_p_group_service.dart';

class PGroupCategoryController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  Future<void> onInit() async {
    groupService = PGroupService(vexaFireManager.networkManager);
    await getGroups();
    super.onInit();
  }

  RxList<TGroupModel> groups = <TGroupModel>[].obs;
  late IPGroupService groupService;
  final RxBool isLoading = false.obs;
  void join() {
    print("Join Islemi yapilmali");
  }

  Future<List<TGroupModel>> getGroups() async {
    isLoading.value = true;
    final List<TGroupModel> fetchedGroups =
        await groupService.getGroupsByCategory(categoryName: "Depresyon");
    groups.addAll(fetchedGroups);
    isLoading.value = false;
    return fetchedGroups;
  }
}
