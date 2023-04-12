import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/therapist/message/t_message_controller.dart';
import '../../../core/base/component/buttons/election.dart';
import '../../../core/base/component/group/person.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../../participant/message/p_message_view.dart';

class TSearchMessageView extends StatefulWidget {
  const TSearchMessageView({super.key});

  @override
  State<TSearchMessageView> createState() => _TSearchMessageViewState();
}

class _TSearchMessageViewState extends State<TSearchMessageView> {
  TMessageController therapistMessageController = Get.put(TMessageController());

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
                      isSelectedValue: therapistMessageController.personValue,
                      firstRow: Container(
                        width: SizeUtil.generalWidth,
                        height: SizeUtil.normalValueHeight,
                        decoration: AppBoxDecoration.sendDecoration,
                        child: InkWell(
                            onTap: () {
                              therapistMessageController.onPersonListChange();
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
        context.push(PMessageView());
      },
      row: RowModel(
        text: therapistName,
        leadingIcon: CustomCircleAvatar(
            big: false, imagePath: DemoInformation.imagePath, shadow: false),
        textStyle: AppTextStyles.groupTextStyle(true),
        isAlignmentBetween: true,
      ));
}
