import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../message/message.dart';
import 'available_hours.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: messageappbar(
                  " 15 Dakikalık Seanslarım ",
                  const SizedBox.shrink(),
                  IconButton(
                      onPressed: () {
                        Get.to(const AvailableHours());
                      },
                      icon: IconUtility.clockIcon),
                ),

                //headingtext(false, false, "15 Dakikalık Seanslarım"),
              ),
              orderdrpdown(),
              aboutparticipant(),
            ],
          ),
        ),
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

  Align orderdrpdown() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: CustomDropDown(
            purpose: orderingList,
            height: 36,
            width: 135,
          ),
        ));
  }
}
