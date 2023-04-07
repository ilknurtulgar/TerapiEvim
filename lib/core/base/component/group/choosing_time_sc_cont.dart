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
      this.isChosenInListView = false,});
  final String? therapistName;
  final String date;
  final List<String> timeList;
  final bool isForParticipant;
  final bool isChosenInListView;
  // danışan ara yüzü
    // amaç: müsait olunan saati seçmek için
    // component kullanımı: 
       // terapistName verilmeli
       // sayfada kullanırken listview.builder kullanıldığı zaman isChosenInListView'ın componentin seçilip seçilmemesine göre değişmesi gerekiyor
  // terapist ara yüzü
    // amaç: belirli tarihe ait saatleri o tarihten kaldırmak için
    // component kullanımı: ek bir şeye gerek yok

  late var newList = timeList.obs;
  var isVisible = true.obs;

  late RxList<bool> isChosen = RxList.filled(timeList.length, false);
  late RxList<bool> updatedIsChosenList = isChosenInListView ? isChosen :  RxList.filled(timeList.length, false);

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
                        ? rowView(
                            UiBaseModel.secDeterminationModel(
                                therapistName!, IconUtility.personIcon),
                            AppPaddings.componentOnlyPadding(4))
                        : const SizedBox(),
                    rowView(
                        UiBaseModel.secDeterminationModel(
                            'Tarih: $date', IconUtility.calendarIcon),
                        AppPaddings.componentOnlyPadding(4)),
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
          int i = 0;
          if (isChosenInListView) {
            for (i = 0; i < isChosen.length; i++) {
              if (i == rowIndex)
                isChosen[i] = true;
              else
                isChosen[i] = false;
            }
          }
          print(isChosen);
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
          color: updatedIsChosenList[rowIndex]//isChosen[rowIndex] == true && isChosenInListView
              ? AppColors.black
              : AppColors.transparent)),
    );
  }
}
