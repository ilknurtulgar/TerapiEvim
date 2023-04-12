// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
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
      this.callBack,
      this.listViewIndex,
      this.listViewChosenList});
  final String? therapistName;
  final String date;
  final List<String> timeList;
  final bool isForParticipant;
  final Function? callBack;
  final int? listViewIndex;
  final RxList<bool>? listViewChosenList;

  late var newList = timeList.obs;
  var isVisible = true.obs;

  late RxList<bool> isChosen = RxList.filled(timeList.length, false);

  void choose(int index, RxList<bool> list, bool isInsideComponent) {
    int i = 0;
    for (i = 0; i < list.length; i++) {
      if (i == index) {
        list[i] = true;
        if (isInsideComponent) callBack!(date, timeList[i]);
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
                padding: AppPaddings.customContainerInsidePadding(3),
                child: Column(
                  children: [
                    isForParticipant
                        ? RowView(
                            rowModel: UiBaseModel.secDeterminationModel(
                                therapistName!, IconUtility.personIcon),
                            padding: AppPaddings.componentOnlyPadding(4))
                        : const SizedBox(),
                    RowView(
                        rowModel: UiBaseModel.secDeterminationModel(
                            'Tarih: $date', IconUtility.calendarIcon),
                        padding: AppPaddings.componentOnlyPadding(4)),
                    isForParticipant
                        ? timeButtonList()
                        : Obx(() => timeButtonList()),
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
                time: newList[index],
                onDeleted: () {
                  newList.remove(newList[index]);
                  if (newList.isEmpty) isVisible.value = false;
                },
              );
      }),
    );
  }

  Padding participantChoosingTimeButton(int rowIndex) {
    return Padding(
      padding: rowIndex == timeList.length - 1
          ? AppPaddings.componentOnlyPadding(1)
          : AppPaddings.componentPadding,
      child: PersonMin(
        onTap: () {
          choose(listViewIndex!, listViewChosenList!, false);
          if (listViewChosenList![listViewIndex!])
            choose(rowIndex, isChosen, true);
        },
        row: timeButtonInsideRow(rowIndex),
      ),
    );
  }

  RowModel timeButtonInsideRow(int rowIndex) {
    return RowModel(
      isAlignmentBetween: true,
      text: timeList[rowIndex],
      textStyle: AppTextStyles.normalTextStyle('medium', false),
      leadingIcon: IconUtility.clockIcon,
      trailingIcon: Obx(() => Icon(Icons.check_circle_outline,
          color:
              isChosen[rowIndex] == true && listViewChosenList![listViewIndex!]
                  ? AppColors.black
                  : AppColors.transparent)),
    );
  }
}
