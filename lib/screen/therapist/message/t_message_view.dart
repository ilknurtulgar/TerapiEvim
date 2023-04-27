import 'package:flutter/material.dart';
import 'package:terapievim/product/widget/common/empty_sizedbox_text.dart';

import '../../../controller/therapist/message/t_message_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/ui_models/card_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import 'component/chat_information.dart';
import 't_search_message_view.dart';

class TMessageView extends StatelessWidget {
  const TMessageView({super.key});
  final bool isService = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<TMessageController>(
      getController: TMessageController(),
      onPageBuilder: (context, controller) {
        return Scaffold(
          appBar: MyAppBar(
            title: MessageTextUtil.messageapptext,
            actions: [
              IconButton(
                  onPressed: () {
                    context.push(const TSearchMessageView());
                  },
                  icon: IconUtility.addmesaage),
            ],
          ),
          body: isService == false
              ? Padding(
                  padding: AppPaddings.pagePadding, child: EmptySizedBoxText())
              : ListView.builder(
                  padding: AppPaddings.pagePadding,
                  itemBuilder: (context, index) {
                    return ChatInformation(
                      cardModel: cardModels[index],
                    );
                  },
                  itemCount: 2,
                ),
        );
      },
    );
  }
}

List<CardModel> cardModels = [
  cardModelhome(
      "Uzman Psikolog", "assets/images/doctorfotosu.jpeg", "Yasemin Kara"),
  cardModelhome("Uzman Psikolog", "assets/images/f1.jpg", "Gizem Kara"),
];
List<CardModel> cardModelsx = [
  cardModelhome("Uzman Psikolog", "assets/images/f1.jpg", "Rümeysa Kara"),
  cardModelhome("Uzman Psikolog", "assets/images/f1.jpg", "Rümeysa Kara"),
];
CardModel cardModelhome(String subtitle, String imgePath, String title) {
  return CardModel(subtitle: subtitle, imagePath: imgePath, title: title);
}
