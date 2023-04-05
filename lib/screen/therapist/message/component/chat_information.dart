import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/component/home/custom_container.dart';
import '../../../../core/base/ui_models/card_model.dart';
import '../../../../core/base/ui_models/container_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../participant/message/p_message_view.dart';

class ChatInformation extends StatefulWidget {
  const ChatInformation({
    super.key,
    required this.cardModel,
  });

  final CardModel cardModel;

  @override
  State<ChatInformation> createState() => _ChatInformationState();
}

ContainerModel? containerModel;

class _ChatInformationState extends State<ChatInformation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(PMessageView()),
      child: CustomContainer(
          time: DemoInformation.clock,
          containerModel: AppContainers.classicWhiteContainer,
          isThereCardModel: true,
          cardModel: widget.cardModel),
    );
  }
}
