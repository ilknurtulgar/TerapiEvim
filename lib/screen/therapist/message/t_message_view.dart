import 'package:flutter/material.dart';

import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/extension/context_extension.dart';
import '../activity/t_new_activity_view.dart';
import 'companent/chat_information.dart';
import 't_search_message_view.dart';

class TMessageView extends StatefulWidget {
  const TMessageView({super.key});

  @override
  State<TMessageView> createState() => _TMessageViewState();
}

class _TMessageViewState extends State<TMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.pagePadding,
        child: Column(
          children: [
            secappview(UiBaseModel.secRowModel(
              IconButton(
                  onPressed: () {
                    context.push(const TSearchMessageView());
                  },
                  icon: IconUtility.addmesaage),
              MessageTextUtil.messageapptext,
            )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatInformation(
                    cardModel: DemoInformation.cardModelhome,
                  );
                },
                itemCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
