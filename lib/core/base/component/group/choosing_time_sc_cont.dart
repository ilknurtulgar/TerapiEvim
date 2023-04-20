// ignore: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import '../../../../model/therapist/session/free_date/t_free_hours_model.dart';
import '../../../managers/converter/date_time_manager.dart';
import '../../ui_models/row_model.dart';
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
      required this.isForParticipant,
      this.dateIndex,
      this.listViewChosenList,
      required this.onSelectedHour});
  final String? therapistName;
  final Timestamp date;
  final List<TFreeHoursModel> timeList;
  final bool isForParticipant;
  final int? dateIndex;
  final RxList<bool>? listViewChosenList;
  final Function(int selectedHourId) onSelectedHour;

  late var newList = timeList.obs;
  var isVisible = true.obs;

  late RxList<bool> isChosen = RxList.filled(timeList.length, false);

  void choose(int index, RxList<bool> list, bool isHour) {
    int i = 0;
    for (i = 0; i < list.length; i++) {
      if (i == index) {
        list[i] = true;
        if (isHour) onSelectedHour(index);
      } else {
        list[i] = false;
      }
    }
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: isVisible.value,
        child: Padding(
          padding: AppPaddings.componentPadding,
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: SizeUtil.generalWidth,
              decoration: AppBoxDecoration.noBorder,
              child: Padding(
                padding: AppPaddings.customContainerInsidePadding(1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    mediumSizedBox(),
                    isForParticipant
                        ? RowView(
                            rowModel: UiBaseModel.secDeterminationModel(
                                therapistName ?? "", IconUtility.personIcon),
                            padding: AppPaddings.componentOnlyPadding(4))
                        : const SizedBox(),
                    RowView(
                        rowModel: UiBaseModel.secDeterminationModel(
                            'Tarih: ${DateTimeManager.getFormattedDateFromFormattedString(value: date.toDate().toIso8601String())}',
                            IconUtility.calendarIcon),
                        padding: AppPaddings.componentOnlyPadding(4)),
                    isForParticipant
                        ? timeButtonList()
                        : Obx(() => timeButtonList()),
                    smallSizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget timeButtonList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: isForParticipant ? timeList.length : newList.length,
      itemBuilder: ((context, index) {
        return isForParticipant
            ? participantChoosingTimeButton(index)
            : DeletingTimeButton(
                time: newList[index].hour ?? "null",
                onDeleted: () {
                  newList.remove(newList[index]);
                  if (newList.isEmpty) isVisible.value = false;
                },
              );
      }),
    );
  }

  Widget participantChoosingTimeButton(int hourIndex) {
    return PersonMin(
      onTap: () {
        choose(dateIndex!, listViewChosenList!, false);
        if (listViewChosenList![dateIndex!]) choose(hourIndex, isChosen, true);
      },
      row: timeButtonInsideRow(hourIndex),
    );
  }

  RowModel timeButtonInsideRow(int rowIndex) {
    return RowModel(
      isAlignmentBetween: true,
      text: timeList[rowIndex].hour ?? "null",
      textStyle: AppTextStyles.normalTextStyle('medium', false),
      leadingIcon: IconUtility.clockIcon,
      trailingIcon: Obx(() => Icon(Icons.check_circle_outline,
          color: isChosen[rowIndex] == true && listViewChosenList![dateIndex!]
              ? AppColors.black
              : AppColors.transparent)),
    );
  }
}
