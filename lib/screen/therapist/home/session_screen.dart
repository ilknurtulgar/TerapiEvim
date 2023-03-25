import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';

import '../message/message.dart';
import 'available_hours.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                messageappbar(
                  HomeTextUtil.myMinuteSessions,
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: IconUtility.back),
                  IconButton(
                      onPressed: () {
                        context.push(const AvailableHours());
                      },
                      alignment: Alignment.centerRight,
                      icon: IconUtility.clockIcon),
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
}

Widget orderdropdown() {
  return const CustomDropDown(
    isGenderPurpose: false,
    height: SizeUtil.smallValueHeight,
    width: SizeUtil.normalValueWidth,
  );
}
