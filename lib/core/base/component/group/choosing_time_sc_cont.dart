import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/screen/participant/group/util/group_screen_utility.dart';
import '../../models/row_model.dart';
import 'row_view.dart';

// ignore: must_be_immutable
class ChoosingTimeForSCContainer extends StatelessWidget {
  // choosing time for short call container
  ChoosingTimeForSCContainer(
      {super.key,
      required this.therapistName,
      required this.date,
      required this.timeList,
      required this.listviewIndex}); 
  final String therapistName;
  final String date;
  final List<String> timeList;
  final int listviewIndex;
  bool isForParticipant = false; // required döndürülecek,şu anda döndürülünce hata geldi öbür sayfalardan
  GroupController groupController = Get.find();
  TherapistGroupController therapistGroupController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: isForParticipant ? true : therapistGroupController.timeListInControllerList[listviewIndex].isEmpty ? false: true,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 342,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  rowView(GroupScreenUtility.therapistRowInChoosingTimeForSCC(therapistName),const EdgeInsets.fromLTRB(25, 15, 25, 4)),
                  rowView(GroupScreenUtility.dateRowInChoosingTimeForSCC(date),const EdgeInsets.fromLTRB(25, 7, 25, 10)),
                  timeButtonList(),
                  const SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView timeButtonList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: isForParticipant ? timeList.length : therapistGroupController.timeListInControllerList[listviewIndex].length,
      itemBuilder: ((context, index) {
        return timeButton(index);
      }),
    );
  }

  Padding timeButton(int rowIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: PersonMin(
          height: 40,
          width: 304,
          onTap: isForParticipant ? () => groupController.choosingTime(timeList.length,rowIndex,listviewIndex) : (){},
          row: RowModel(
            isAlignmentBetween: true,
            text:  isForParticipant ? timeList[rowIndex] :  therapistGroupController.timeListInControllerList[listviewIndex][rowIndex],
            textStyle: AppTextStyles.normalTextStyle('medium', false),
            leadingIcon: IconUtility.clockIcon,
            trailingIcon: isForParticipant 
              ? Obx(
                 () => Icon(IconUtility.checkCircleIcon,
                  color: listviewIndex == groupController.listviewIndexInController.value && rowIndex == groupController.rowIndexInController.value
                      ? AppColors.black
                      : AppColors.transparent))
             : IconButton(
                  onPressed: () => therapistGroupController.deleteTime(timeList,rowIndex,listviewIndex),
                  icon: const Icon(Icons.delete_outline)
            ),
          ),
      ),
    );
  }
}
