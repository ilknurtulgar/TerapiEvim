import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:terapievim/model/therapist/session/free_date/t_free_date_model.dart';
import 'package:terapievim/product/widget/common/empty_sized_box_text.dart';

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
              body: Padding(
                padding: AppPaddings.pagePadding,
                child: choosingTime(controller),
              ),
            ));
  }

  Widget choosingTime(TAvailableHoursViewController controller) {
    return Obx(
      () => controller.sessionTimeList.isEmpty
          ? EmptySizedBoxText()
          : ListView.builder(
              itemBuilder: (context, index) {
                final TFreeDateModel? tFreeDateModel =
                    controller.sessionTimeList[index];
                return Padding(
                    padding: AppPaddings.timeChossingBetweenPadding,
                    child: ChoosingTimeForSCContainer(
                      onSelectedHour: (selectedHourId) {},
                      date: tFreeDateModel?.dateTime ?? Timestamp.now(),
                      timeList: tFreeDateModel?.hours.toList() ?? [],
                      isForParticipant: false,
                    ));
              },
              itemCount: controller.sessionTimeList.length,
            ),
    );
  }
}
