import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/service/_therapist/activity/t_activity_service.dart';

class TMyActivityListViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    tActivityService = TActivityService(vexaFireManager.networkManager);
    List<TActivityModel?> myActivity =
        await tActivityService.getMyPastActivitiesOrdered();
    fetchedMyActivity.addAll(myActivity);
    super.onInit();
  }

  late TActivityService tActivityService;
  RxList<TActivityModel?> fetchedMyActivity = <TActivityModel?>[].obs;
}
