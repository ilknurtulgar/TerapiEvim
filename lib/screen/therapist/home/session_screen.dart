import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import 'available_hours.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: AppPaddings.pagePadding,
            child: Column(
              children: [
                doubleappbar(
                  HomeTextUtil.myMinuteSessions,
                  backButton(context, () => context.pop()),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.push(const AvailableHours());
                      },
                      icon: IconUtility.clockIcon),
                ),
                sizedbox(),
                aboutparticipant(),
              ],
            ),
          ),
          Positioned(top: 90, right: 24, child: orderdropdown()),
        ]),
      ),
    );
  }

  ListView aboutparticipant() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return participantWihtShortCallTime(
            DemoInformation.copingList[index], DemoInformation.date);
      },
      itemCount: DemoInformation.copingList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

Widget orderdropdown() {
  return Obx(
    () => CustomDropDown(
      ontap: (int index) {
        print("çalismiyorki");
        activityController.func(DemoInformation.orderingList[index]);
        activityController.changeBox();
      },
      textlist: DemoInformation.orderingList,
      widget: textpurpose(activityController.order.value),
      height: SizeUtil.smallValueHeight,
      width: SizeUtil.normalValueWidth,
    ),
  );
}
