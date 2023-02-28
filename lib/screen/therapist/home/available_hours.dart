import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/choosing_time_sc_cont.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/therapist/home/add_hours_screen.dart';
import 'package:terapievim/screen/therapist/message/message.dart';

import '../../participant/group/util/group_screen_utility.dart';

class AvailableHours extends StatelessWidget {
  const AvailableHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            messageappbar(
                "Müsaait Olduğum Saatler",
                const SizedBox.shrink(),
                IconButton(
                    onPressed: () {
                      Get.to(const AddHoursScreen());
                    },
                    icon: IconUtility.addIcon)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: GroupPaddings.timeChossingBetweenPadding,
                  child: ChoosingTimeForSCContainer(
                      therapistName: DemoInformation.nameSurname,
                      date: DemoInformation.date,
                      timeList: DemoInformation.timelist,
                      listviewIndex: 3),
                );
              },
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
