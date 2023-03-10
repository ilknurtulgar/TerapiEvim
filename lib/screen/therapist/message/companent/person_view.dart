import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/t_message_controller.dart';

import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/component/home/custom_container.dart';
import '../../../../core/base/models/card_model.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

class PersonView extends StatelessWidget {
  PersonView({super.key, required this.gruopName, required this.list});
  final String gruopName;
  final List<String> list;
  final TherapistyMessageController therapistyMessageController =
      Get.put(TherapistyMessageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.generalPadding,
          child: Container(
            width: SizeUtil.generalWidth,
            height: 60,
            decoration: AppBoxDecoration.sendDecoration,
            child: InkWell(
                onTap: () {
                  therapistyMessageController.personListchange();
                },
                child: rowView(
                    RowModel(
                        text: gruopName,
                        textStyle:
                            AppTextStyles.normalTextStyle("medium", false),
                        isAlignmentBetween: true,
                        trailingIcon: IconUtility.arrowDown),
                    AppPaddings.generalPadding)),
          ),
        ),
        Obx(
          () => therapistyMessageController.personvalue.value
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
