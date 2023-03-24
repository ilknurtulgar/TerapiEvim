// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import '../../../../controller/group_controller.dart';
import '../../../../controller/therapist_group_controller.dart';
import '../../models/row_model.dart';
import '../../util/base_model.dart';
import '../../util/base_utility.dart';
import 'deleting_time_button.dart';

// ignore: must_be_immutable
class ChoosingTimeForSCContainer extends StatelessWidget {
  // choosing time for short call container
  ChoosingTimeForSCContainer(
      {super.key,
      this.therapistName,
      required this.date,
      required this.timeList,
      required this.listviewIndex,
      required this.isForParticipant});
  final String? therapistName;
  final String date;
  final List<String> timeList;
  final int listviewIndex;
  final bool isForParticipant;
  GroupController groupController = Get.find();
  TherapistGroupController therapistGroupController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: SizeUtil.generalWidth,
          decoration: AppBoxDecoration.noBorder,
          child: Padding(
            padding: AppPaddings.customContainerInsidePadding(3),
            child: Column(
              children: [
                isForParticipant ? rowView(UiBaseModel.secDeterminationModel(therapistName!, IconUtility.personIcon),AppPaddings.rowLeftSmallPadding) : const SizedBox(),
                rowView(UiBaseModel.secDeterminationModel('Tarih: $date', IconUtility.calendarIcon),AppPaddings.rowLeftSmallPadding),
                timeButtonList(),
              ],
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
      itemCount: isForParticipant
          ? timeList.length
          : therapistGroupController.timeListsInController[listviewIndex].length,
      itemBuilder: ((context, index) {
        return isForParticipant
          ? participantChoosingTimeButton(index)
          : DeletingTimeButton(rowIndex: index, listViewIndex: listviewIndex,isInMainPage: true,);
      }),
    );
  }

  Padding participantChoosingTimeButton(int rowIndex) {
    return Padding(
      padding: rowIndex == timeList.length - 1
            ? AppPaddings.componentOnlyPadding(true)
            : AppPaddings.componentPadding,
      child: PersonMin(
        onTap: () => groupController.choosingTime(timeList.length, rowIndex, listviewIndex),
        row: timeButtonInsideRow(rowIndex),
      ),
    );
  }

  RowModel timeButtonInsideRow(int rowIndex) {
    return RowModel(
      isAlignmentBetween: true,
      text:  timeList[rowIndex],
      textStyle: AppTextStyles.normalTextStyle('medium', false),
      leadingIcon: IconUtility.clockIcon,
      trailingIcon: Obx(() => Icon(Icons.check_circle_outline,
              color: listviewIndex ==
                          groupController.listviewIndexInController.value &&
                      rowIndex == groupController.rowIndexInController.value
                  ? AppColors.black
                  : AppColors.transparent)),
    );
  }
}
