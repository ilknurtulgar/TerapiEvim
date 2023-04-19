import 'package:flutter/material.dart';

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
//kullanıcılar
  @override
  Widget build(BuildContext context) {
    return BaseView<TMessageController>(
      getController: TMessageController(),
      onPageBuilder: (context, controller) {
        controller.getAllUsers();

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
          body: ListView.builder(
            padding: AppPaddings.pagePadding,
            itemBuilder: (context, index) {
              return ChatInformation(
                cardModel: cardModelhome(controller),
              );
            },
            itemCount: 2,
          ),
        );
      },
    );
  }
}

CardModel cardModelhome(TMessageController tMessageController) {
  return CardModel(
      subtitle: "Uzman Psikolog",
      imagePath: "assets/images/doctorfotosu.jpeg",
      title: "Günay Kara");
}
