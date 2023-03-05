import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/message/companent/person_view.dart';
import 'package:terapievim/screen/therapist/message/message.dart';

import '../../../core/base/util/text_utility.dart';

class SearchMessage extends StatefulWidget {
  const SearchMessage({super.key});

  @override
  State<SearchMessage> createState() => _SearchMessageState();
}

class _SearchMessageState extends State<SearchMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                searchappbar(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PersonView(
                        gruopName: DemoInformation.groupList[index],
                        list: DemoInformation.personList);
                  },
                  itemCount: DemoInformation.groupList.length,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchappbar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          search(RowModel(
              text: MessageTextUtil.searchtext,
              textStyle: AppTextStyles.normalTextStyle("medium", true),
              isAlignmentBetween: true,
              leadingIcon: IconUtility.searchIcon,
              trailingIcon: IconButton(
                  onPressed: () {
                    Get.to(const TherapistMessageScreen());
                  },
                  icon: IconUtility.closeIcon))),
          divider(true),
        ],
      ),
    );
  }
}
