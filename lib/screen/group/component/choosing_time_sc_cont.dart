import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/person.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';
import 'package:terapievim/controller/group_controller.dart';
import '../../../core/base/models/row_model.dart';
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
  GroupController groupController = Get.put(
      GroupController()); // başka yerde daha kullanılmağı için geçici olarak get put ile koydum controller'ı
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 342,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              rowView(GroupScreenUtility.therapistRowInChoosingTimeForSCC(therapistName),const EdgeInsets.fromLTRB(25, 15, 25, 4)),
              rowView(GroupScreenUtility.dateRowInChoosingTimeForSCC(date),const  EdgeInsets.fromLTRB(25, 7, 25,  10)),
              timeChoosingButtonList(),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  ListView timeChoosingButtonList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: timeList.length,
      itemBuilder: ((context, index) {
        return timeChoosingButton(index);
      }),
    );
  }

  Padding timeChoosingButton(int rowIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: PersonMin(
          height: 40,
          width: 304,
          onTap: () => groupController.choosingTime(
              timeList.length, rowIndex, listviewIndex),
          row: RowModel(
            isAlignmentBetween: true,
            text: timeList[rowIndex],
            textStyle: AppTextStyles.normalTextStyle('medium', false),
            leadingIcon: IconUtility.clockIcon,
            trailingIcon: Obx(
              () => Icon(IconUtility.checkCircleIcon,
                  color: listviewIndex ==
                              groupController.listviewIndexInController.value &&
                          rowIndex == groupController.rowIndexInController.value
                      ? AppColors.black
                      : AppColors.transparent),
            ),
          )),
    );
  }
}
