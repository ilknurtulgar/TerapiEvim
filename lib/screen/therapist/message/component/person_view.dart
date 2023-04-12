import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/message/t_message_controller.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/component/home/custom_container.dart';
import '../../../../core/base/ui_models/card_model.dart';
import '../../../../core/base/util/base_model.dart';
import '../../../../core/base/util/base_utility.dart';

class PersonView extends StatelessWidget {
  PersonView({super.key, required this.groupName, required this.list});

  final String groupName;
  final List<String> list;
  final TMessageController therapistyMessageController =
      Get.put(TMessageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.generalPadding,
          child: Container(
            width: SizeUtil.generalWidth,
            height: SizeUtil.normalValueHeight,
            decoration: AppBoxDecoration.sendDecoration,
            child: InkWell(
                onTap: () {
                  therapistyMessageController.onPersonListChange();
                },
                child: RowView(
                    rowModel: UiBaseModel.personviewRowModel(groupName),
                    padding: AppPaddings.generalPadding)),
          ),
        ),
        Obx(
          () => therapistyMessageController.personValue.value
              ? personlistview()
              : const SizedBox.shrink(),
        )
      ],
    );
  }

  Widget personlistview() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: AppPaddings.generalPadding,
            child: Align(
                alignment: Alignment.center,
                child: CustomContainer(
                    containerModel: AppContainers.classicWhiteContainer,
                    isThereCardModel: true,
                    cardModel: CardModel(
                        imagePath: DemoInformation.japonkadin,
                        title: list[index]))));
      },
      itemCount: list.length,
    );
  }
}
