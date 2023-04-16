import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist/home/session/t_available_hours_view_controller.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import '../../../controller/therapist/home/session/t_add_hours_view_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../core/base/component/group/custom_heading.dart';
import '../../../core/base/component/group/deleting_time_button.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../product/widget/common/button/butterfly_button.dart';
import '../../../product/widget/common/profile/utility/textfield_utility.dart';
import '../../../product/widget/common/textfield/date_text_field.dart';

class TAddHoursView extends StatefulWidget {
  TAddHoursView({super.key});

  @override
  State<TAddHoursView> createState() => _TAddHoursViewState();
}

class _TAddHoursViewState extends State<TAddHoursView> {
  void initState() {
    mainController = Get.find();
    super.initState();
  }

  late TAvailableHoursViewController mainController;
  SessionTime sessionTime = SessionTime(date: '', timeList: []);

  RxList<String> timeList = RxList<String>.empty();

  String chosenDate = '';

  @override
  Widget build(BuildContext context) {
    return BaseView<TAddHoursViewController>(
      getController: TAddHoursViewController(),
      onPageBuilder: (context, TAddHoursViewController controller) => Scaffold(
        appBar: MyAppBar(
          title: ActivityTextUtil.addNewClock,
        ),
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              _minHeading(ActivityTextUtil.date),
              _dateAdd(controller),
              _minHeading(ActivityTextUtil.addClock),
              clockAddTime(controller),
              _minHeading(ActivityTextUtil.clocks),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: timeList.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => DeletingTimeButton(
                        time: timeList[index],
                        onDeleted: () {
                          timeList.remove(timeList[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              ButterFlyButton(
                  buttonOnTap: () {
                    sessionTime.date = controller.dateAddController.text;
                    sessionTime.timeList = timeList;
                    mainController.sessionTimeList.add(sessionTime);
                    print(mainController.sessionTimeList[0].date);
                    print(mainController.sessionTimeList[0].timeList);
                    context.pop();
                  },
                  buttonName: ActivityTextUtil.save)
            ],
          ),
        ),
      ),
    );
  }

  Padding clockAddTime(TAddHoursViewController controller) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => ChoosingTimeGroupTherapy(
                onTap: () {
                  controller.showChoosingTimeDialog();
                },
                hour: controller.chosenHour.value,
                minutes: controller.chosenMinutes.value),
          ),
          CircleAvatar(
            backgroundColor: AppColors.butterflyBush,
            child: IconButton(
                onPressed: () {
                  String time;
                  time =
                      '${controller.chosenHour.value}:${controller.chosenMinutes.value}';
                  timeList.add(time);
                  print(timeList);
                },
                icon: IconUtility.addIcon),
          )
        ],
      ),
    );
  }

  CustomHeading _minHeading(String text) {
    return CustomHeading(
      text: text,
      isalignmentstart: true,
      isToggle: false,
      padding: AppPaddings.componentPadding,
    );
  }
}

DateTextField _dateAdd(TAddHoursViewController controller) {
  return DateTextField(
    textController: controller.dateAddController,
    isBig: true,
    dateTapped: () => choosingBirthday(controller.dateAddController),
  );
}

class SessionTime {
  String date;
  List<String> timeList;
  SessionTime({
    required this.date,
    required this.timeList,
  });
}
