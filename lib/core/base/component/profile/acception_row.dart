import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../util/text_utility.dart';

class AcceptionRow extends StatelessWidget {
  const AcceptionRow({
    super.key,
    required this.isForMakingShortCall,
    required this.acceptionFunction,
    required this.value,
  });
  final bool isForMakingShortCall;
  final Function() acceptionFunction;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: isForMakingShortCall
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        textDirection:
            isForMakingShortCall ? TextDirection.ltr : TextDirection.rtl,
        children: [
         IconButton(
              onPressed: acceptionFunction,
              icon: Icon(value == true
                      ? IconUtility.checkCircleIcon.icon
                      : IconUtility.circleIcon.icon
                 )),
          Expanded(
            child: responsivenestext(
                isForMakingShortCall
                    ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                    : ProfileSettingsTextUtil.therapistAcceptedRandomTherapistList,
                const TextStyle()),
          )
        ]);
  }
}
