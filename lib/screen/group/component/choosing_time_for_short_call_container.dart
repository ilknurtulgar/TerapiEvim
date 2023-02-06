import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/person.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';
import 'package:terapievim/service/group_controller.dart';
import '../../../models/row_model.dart';
import '../../../models/row_view.dart';

class ChoosingTimeForSCContainer extends StatelessWidget { // choosing time for short call container
   ChoosingTimeForSCContainer({super.key,
      required this.therapistName,
      required this.date,
      required this.timeList});
  final String therapistName;
  final String date;
  final List<String> timeList;
  GroupController groupController=Get.put(GroupController()); // başka yerde daha kullanılmağı için geçici olarak get put ile koydum controller'ı
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 342,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height:30,width: 300,child: rowView(GroupScreenUtility.therapistRowInChoosingTimeForSCC(therapistName),const EdgeInsets.symmetric(horizontal: 20))),
              SizedBox(height:30,width: 300,child: rowView(GroupScreenUtility.dateRowInChoosingTimeForSCC(date),const EdgeInsets.symmetric(horizontal: 20))),
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

  Padding timeChoosingButton(int index) {
    return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  child: PersonMin(
                    height: 40,
                    width: 304,
                    onTap: () => groupController.choosingTime(timeList.length,index),
                    row: RowModel(
                        isAlignmentBetween: true,
                        text: timeList[index],
                        textStyle: AppTextStyles.normalTextStyle('medium', false),
                        leadingIcon:  IconUtility.clockIcon,
                        trailingIcon: Obx(
                          () => Icon(
                            IconUtility.checkCircleIcon,
                            color: index == groupController.indexInController.value ? AppColors.black : AppColors.transparent
                            ),
                           ),
                          )),
                        );
  }
}