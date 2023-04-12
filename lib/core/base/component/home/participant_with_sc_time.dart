import 'package:terapievim/core/base/component/profile/container/two_row_short_container.dart';
import '../../util/base_utility.dart';

TwoRowShortContainer participantWithShortCallTime(String participantName,
        String time, Function() firstOnTap, Function() secondOnTap) =>
    TwoRowShortContainer(
      row1Text: participantName,
      row2Text: time,
      firstIconData: IconUtility.navProfile,
      secondIconData: IconUtility.clockIcon.icon!,
      purpose: ContainerPurpose.date,
      firstOnTap: firstOnTap,
      secondOnTap: secondOnTap,
    ); // birinci satırda danışan ismi ikinci satırda 15 dakikalık seansın tarihinin ve zamanının yazdığı container