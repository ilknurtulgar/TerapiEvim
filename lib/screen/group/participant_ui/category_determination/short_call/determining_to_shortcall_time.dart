import 'package:flutter/material.dart';

import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group/component/choosing_time_for_short_call_container.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/group/util/group_screen_utility.dart';

import '../../../component/heading.dart';

import '../../../util/text_util.dart';

// ignore: must_be_immutable
class ShortCallTime extends StatelessWidget {
  ShortCallTime({super.key});
  // gecici
  String therapistName = "Yasemin Bebek";
  String datetime = "27.01.2023";
  List<String> timelist = ["12.00", "15.00", "20.00"];
  String userName = "Yasemin";
  int tmpCount = 5;

  @override
  Widget build(BuildContext context) {
    String hiUser = "Merhaba $userName";
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customAppBar(),
            const Divider(
              color: AppColors.black,
            ),
            Heading(
              headingText: hiUser,
            ),
            const PurpleBorderWhiteInsideTextContainer(
                text: GroupTexts.shortCallDateChooseText),
            timeChoose()
          ],
        ),
      ),
    );
  }

  Widget timeChoose() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tmpCount,
      itemBuilder: (context, index) => Padding(
        padding: GroupPaddings.timeChossingBetweenPadding,
        child: ChoosingTimeForSCContainer(
          therapistName: therapistName,
          date: datetime,
          timeList: timelist,
          listviewIndex: index,
        ),
      ),
    );
  }

  Padding customAppBar() {
    return Padding(
      padding: GroupPaddings.appbarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 20,
          ),
          Heading(
            headingText: GroupTexts.terapiEvim,
            padding: GroupPaddings.shortCallHeadingPadding,
          ),
          IconButton(
            icon: IconUtility.save,
            onPressed: () {
              //kategori secimi kaydedilecek
              //print("Kategori secildi yegenim");
            },
          )
        ],
      ),
    );
  }
}
