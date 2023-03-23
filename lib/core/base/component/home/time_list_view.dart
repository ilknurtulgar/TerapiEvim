import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/group/choosing_time_sc_cont.dart';

// ignore: must_be_immutable
class TherapistTimeContainerListView extends StatelessWidget {
  TherapistTimeContainerListView({super.key, required this.dateList});
  final List<String> dateList;
  TherapistGroupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
       itemCount: controller.timeListsInController.length,
       itemBuilder: ((context, index) {
        return Obx(
          () => Visibility(
              visible:  controller.timeListsInController[index].isEmpty ? false : true,
              child: ChoosingTimeForSCContainer(
                date: dateList[index],
                timeList: controller.timeListsInController[index],
                listviewIndex: index,
                isForParticipant: false,),
          ),
        );
      })),
    );
  }
}
