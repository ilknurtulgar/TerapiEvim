import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../../core/base/component/group/choosing_time_sc_cont.dart';
import '../../../../../core/base/component/group/custom_heading.dart';
import '../../../../../core/base/util/base_model.dart';
import '../../../../../core/base/util/text_utility.dart';

// ignore: must_be_immutable
class PShortCallTimeView extends StatelessWidget {
   PShortCallTimeView({super.key});

  // gecici

  var isChosen = List.filled(DemoInformation.tmpCount,false).obs;
  String chosenDate = '';
  String chosenTime = '';

  void callBack(String chosenDateInContainer, String chosenTimeInContainer) {
    chosenDate = chosenDateInContainer;
    chosenTime = chosenTimeInContainer;
    print('$chosenDate $chosenTime');
  }

  @override
  Widget build(BuildContext context) {
    String hiUser = "Merhaba ${DemoInformation.userName}";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              rowView(
                  UiBaseModel.determiningappBar(), AppPaddings.appBarPadding),
              line(),
              CustomHeading(
                text: hiUser,
                isalignmentstart: false,
              ),
              const PurpleTextContainer(
                  text: GroupTextUtil.shortCallDateChooseText),
              timeChoose(),
            ],
          ),
        ),
      ),
    );
  }

  Divider line() {
    return const Divider(
      color: AppColors.black,
      indent: 10,
      endIndent: 10,
      height: 0.1,
    );
  }

  Widget timeChoose() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DemoInformation.tmpCount,
      itemBuilder: (context, index) => Padding(
        padding: AppPaddings.timeChossingBetweenPadding,
        child: ChoosingTimeForSCContainer( //sizedBox vardı gerek kalmamıştır diye tahmin edip sildim
            therapistName: DemoInformation.therapistName,
            isForParticipant: true,
            date: DemoInformation.dateList[index],
            timeList: DemoInformation.timelist,
            callBack: callBack,
            listViewChosenList: isChosen,
            listViewIndex: index,
          ),
      ),
    );
  }
}

IconButton saveButton() {
  return IconButton(
    icon: IconUtility.save,
    onPressed: () {},
  );
}
