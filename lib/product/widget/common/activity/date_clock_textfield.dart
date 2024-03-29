import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/component/group/choosing_time_group_therapy.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../group/mini_headings.dart';
import '../profile/utility/textfield_utility.dart';
import '../textfield/date_text_field.dart';

class DateClockTextField extends StatelessWidget {
  const DateClockTextField(
      {super.key,
      required this.textController,
      required this.hour,
      required this.minutes,
      required this.timeStampInController,
      required this.choosingTimeTapped});
  final TextEditingController textController;
  final String hour;
  final String minutes;
  final Rx<Timestamp>? timeStampInController;
  final Function() choosingTimeTapped;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MiniHeading(
            name: ActivityTextUtil.date,
            isInMiddle: false,
            isAlignedInCenter: false),
        DateTextField(
            textController: textController,
            isBig: true,
            dateTapped: () => choosingDate(
                  textController,false,timeStampInController
                )),
        MiniHeading(
            name: ActivityTextUtil.clock,
            isInMiddle: false,
            isAlignedInCenter: false),
        Padding(
          padding: AppPaddings.miniTopPadding,
          child: ChoosingTimeGroupTherapy(
              onTap: choosingTimeTapped, hour: hour, minutes: minutes),
        ),
      ],
    );
  }
}
