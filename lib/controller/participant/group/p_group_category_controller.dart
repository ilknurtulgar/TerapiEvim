import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/model/participant/group/join_group_id_model.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';
import 'package:terapievim/service/_participant/group/p_group_service.dart';

import '../../../model/participant/group/joinable_group_model.dart';
import '../../../service/_participant/group/i_p_group_service.dart';

class PGroupCategoryController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  Future<void> onInit() async {
    groupService = PGroupService(vexaFireManager.networkManager);
    await getGroups();
    super.onInit();
  }

  RxList<JoinableGroupModel> groups = <JoinableGroupModel>[].obs;
  late IPGroupService groupService;
  final RxBool isLoading = false.obs;

  void join(String groupId) async {
    NavigatorState navigator = Navigator.of(controllerContext);
    isLoading.value = true;
    await groupService.joinGroup(JoinGroupIdModel(joinedGroupId: groupId));
    isLoading.value = false;
    navigationManager.pushAndRemoveUntil(navigator, PMyGroupView());
  }

  Future<List<JoinableGroupModel>> getGroups() async {
    isLoading.value = true;
    final List<JoinableGroupModel> fetchedGroups =
        await groupService.getGroupsByCategory(categoryName: "Depresyon");
    groups.addAll(fetchedGroups);
    isLoading.value = false;
    return fetchedGroups;
  }
}
