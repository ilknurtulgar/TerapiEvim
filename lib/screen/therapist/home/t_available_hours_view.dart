import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../controller/therapist/home/session/t_available_hours_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/choosing_time_sc_cont.dart';
import '../../../core/base/view/base_view.dart';
import 't_add_hours_view.dart';

class TAvailableHoursView extends StatelessWidget {
  TAvailableHoursView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<TAvailableHoursViewController>(
        getController: TAvailableHoursViewController(),
        onPageBuilder: (context, TAvailableHoursViewController controller) =>
            Scaffold(
              appBar: MyAppBar(
                title: HomeTextUtil.myAvailableHours,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.push(TAddHoursView());
                      },
                      icon: IconUtility.addcircleIcon)
                ],
              ),
              body: choosingtime(controller),
            ));
  }

  Widget choosingtime(TAvailableHoursViewController controller) {
    return  Obx(
      () => ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: AppPaddings.timeChossingBetweenPadding,
                child:  ChoosingTimeForSCContainer(
                      date: controller.sessionTimeList[index].date, //[index].value.date, //DemoInformation.dateList[index],
                      timeList: controller.sessionTimeList[index].timeList, //DemoInformation.timelist,
                      isForParticipant: false)
                );
            },
            itemCount: controller.sessionTimeList.length,
      ),
    );
  }
}

extension ListDynamicExtension on List<dynamic> {
  List<String> allToString() {
    List<String> newList = [];
    int i = 0;
    for (i = 0; i < length; i++) {
      newList[i] = this[i].toString();
    }
    return newList;
  }
}
