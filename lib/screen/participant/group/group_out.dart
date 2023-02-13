import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import 'util/text_util.dart';

class GroupOut extends StatelessWidget {
  const GroupOut({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconUtility.logoutIcon,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: AppBorderRadius.generalBorderRadius),
          title: const Text(
            GroupTexts.groupOutHeading,
            style: GroupTextStyle.groupOutButton,
          ),
          content: const Text(GroupTexts.groupOutText),
          actions: <Widget>[
            popUpButton(context, GroupTexts.iptal),
            popUpButton(context, GroupTexts.evet),
          ],
        ),
      ),
    );
  }

  TextButton popUpButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        if (text == "IPTAL") {
          //degistirilecek
          //print("Iptal");
        } else {
          //print("evet");
        }
        Navigator.pop(context);
      },
      child: Text(
        text,
        style: GroupTextStyle.groupOutButton,
      ),
    );
  }
}
