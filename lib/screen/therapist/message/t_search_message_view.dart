import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';

import '../../../controller/therapist/message/t_message_all_users_list_controller.dart';
import '../../../core/base/component/buttons/election.dart';
import '../../../core/base/component/group/person.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/component/profile/image/custom_circle_avatar.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../participant/message/p_message_view.dart';

class TSearchMessageView extends StatelessWidget {
  const TSearchMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TMessageAllUsersListController>(
      getController: TMessageAllUsersListController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: "Kullanıcılar"),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: AppPaddings.componentPadding,
              child: Election(
                  isSelectedValue: controller.isOpen[index],
                  firstRow: Obx(
                    () => Container(
                      width: SizeUtil.generalWidth,
                      height: SizeUtil.normalValueHeight,
                      decoration: AppBoxDecoration.sendDecoration,
                      child: InkWell(
                        onTap: () => controller.onPersonListChange(index),
                        child: RowView(
                            rowModel: UiBaseModel.personviewRowModel(
                                "Okb", controller, index),
                            padding: AppPaddings.generalPadding),
                      ),
                    ),
                  ),
                  rows: person(context)),
            );
          },
          itemCount: DemoInformation.groupList.length,
        ),
      ),
    );
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
}
