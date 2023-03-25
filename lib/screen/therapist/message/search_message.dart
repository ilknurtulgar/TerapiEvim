import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/activities.dart';
import 'package:terapievim/screen/therapist/message/companent/person_view.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              searchappbar(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return PersonView(
                      groupName: DemoInformation.groupList[index],
                      list: DemoInformation.personList);
                },
                itemCount: DemoInformation.groupList.length,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchappbar() {
    return Column(
      children: [
        search(UiBaseModel.doubleappbarModel(
            MessageTextUtil.searchtext,
            backButton(context, () => context.pop()),
            closeIcon(() => context.pop()))),
        divider(true),
      ],
    );
  }
}
