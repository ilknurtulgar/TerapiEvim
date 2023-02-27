import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/profile/container/two_row_short_container.dart';

TwoRowShortContainer participantWihtShortCallTime(
        String participantName, String time) =>
    TwoRowShortContainer(
      row1Text: participantName,
      row2Text: time,
      firstIconData: Icons.account_circle_outlined,
      secondIconData: Icons.alarm_outlined,
      purpose: 'date',
      isThereButton: false,
    ); // birinci satırda danışan ismi ikinci satırda 15 dakikalık seansın tarihinin ve zamanının yazdığı container