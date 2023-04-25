import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../../../../model/therapist/session/free_date/t_free_date_model.dart';
import '../../../../service/_therapist/session/free_dates/i_t_free_dates_service.dart';
import '../../../../service/_therapist/session/free_dates/t_free_dates_service.dart';

class TAvailableHoursViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    freeDateService = TFreeDateService(vexaFireManager.networkManager);
    final List<TFreeDateModel?> result =
        await freeDateService.getMyFreeDatesOrdered(isDescending: true);
    sessionTimeList.addAll(result);

    print(result);
    super.onInit();
  }

  late ITFreeDateService freeDateService;
  RxList<TFreeDateModel?> sessionTimeList = <TFreeDateModel?>[].obs;
}
