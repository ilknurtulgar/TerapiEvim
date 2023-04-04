import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/t_message_controller.dart';
import '../../../core/base/component/buttons/election.dart';
import '../../../core/base/component/group/person.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../../screen/participant/message/message.dart';

class SearchMessage extends StatefulWidget {
  const SearchMessage({super.key});

  @override
  State<SearchMessage> createState() => _SearchMessageState();
}

class _SearchMessageState extends State<SearchMessage> {
  TherapistyMessageController therapistyMessageController =
      Get.put(TherapistyMessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              searchappbar(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Election(
                      election: ControllerElection.therapistyMessageController,
                      firstRow: Container(
                        width: SizeUtil.generalWidth,
                        height: SizeUtil.normalValueHeight,
                        decoration: AppBoxDecoration.sendDecoration,
                        child: InkWell(
                            onTap: () {
                              therapistyMessageController.personListchange();
                            },
                            child: rowView(
                                UiBaseModel.personviewRowModel("oke"),
                                AppPaddings.generalPadding)),
                      ),
                      rows: person(context));
                },
                itemCount: DemoInformation.groupList.length,
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
        /*  search(UiBaseModel.doubleappbarModel(
            MessageTextUtil.searchtext,
            backButton(context, () => context.pop()),
            closeIcon(() => context.pop()))),*/
        divider(true),
      ],
    );
  }
}

List<PersonMin> person(BuildContext context) => [
      chatperson("therapistName", context),
      chatperson("therapistName", context)
    ];

PersonMin chatperson(String therapistName, BuildContext context) {
  return PersonMin(
      onTap: () {
        context.push(MessageScreen());
      },
      row: RowModel(
        text: therapistName,
        leadingIcon: CustomCircleAvatar(
            big: false, imagePath: DemoInformation.imagePath, shadow: false),
        textStyle: AppTextStyles.groupTextStyle(true),
        isAlignmentBetween: true,
      ));
}
