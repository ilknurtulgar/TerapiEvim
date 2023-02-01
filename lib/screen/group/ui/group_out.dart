import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/util/text_util.dart';
import 'package:terapievim/service/mainController.dart';

class GroupOut extends StatelessWidget {
  const GroupOut({super.key});

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return IconButton(
      icon: IconUtility.logoutIcon,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.generalBorderRadius),
          title: Text(
            GroupTexts.groupOutHeading,
            style: GroupTextStyle.groupOutButton,
          ),
          content: Text(GroupTexts.groupOutText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                print("Iptal");
                Navigator.pop(context);
              },
              child: const Text(
                'IPTAL',
                style: GroupTextStyle.groupOutButton,
              ),
            ),
            TextButton(
              onPressed: () {
                print("evet");
                //kategori sayfasina yonlendirilmeli controlller ile
              },
              child: const Text(
                'EVET',
                style: GroupTextStyle.groupOutButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
