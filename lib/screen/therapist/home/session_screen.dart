import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import '../message/message.dart';
import 'available_hours.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: AppPaddings.topAppbar,
                  child: messageappbar(
                    HomeTextUtil.myMinuteSessions,
                    const SizedBox.shrink(),
                    IconButton(
                        onPressed: () {
                          Get.to(const AvailableHours());
                        },
                        icon: IconUtility.clockIcon),
                  ),
                ),
                sizedbox(),
                aboutparticipant(),
              ],
            ),
            Positioned(top: 104, right: 24, child: orderdropdown()),
          ]),
        ),
      ),
    );
  }

  ListView aboutparticipant() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return participantWihtShortCallTime(
            //sorun devam ediyor
            DemoInformation.copingList[index],
            DemoInformation.date);
      },
      itemCount: DemoInformation.copingList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Align orderdropdown() {
    return const Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: AppPaddings.componentPadding,
          child: CustomDropDown(
            isGenderPurpose: false,
            height: 36,
            width: 135,
          ),
        ));
  }
}
