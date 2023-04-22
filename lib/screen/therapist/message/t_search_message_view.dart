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
import '../../../model/common/user/user_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
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
            final TGroupModel? groupModel =
                controller.groupIds[index] as TGroupModel?;
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
                                groupModel?.name ?? "empty groupname",
                                controller,
                                index),
                            padding: AppPaddings.generalPadding),
                      ),
                    ),
                  ),
                  rows: person(context, groupModel!, controller)),
            );
          },
          itemCount: controller.groupIds.length,
        ),
      ),
    );
  }

  List<PersonMin> person(BuildContext context, TGroupModel groupModel,
      TMessageAllUsersListController controller) {
    final List<UserModel> listOfUsers = controller.groupUsers[groupModel.id!]!;
    final List<PersonMin> personMinList = [];
    for (UserModel user in listOfUsers) {
      personMinList
          .add(chatperson(user.name ?? "", context, user.imageUrl ?? ""));
    }
    return personMinList;
  }

  PersonMin chatperson(
      String therapistName, BuildContext context, String imagePath) {
    return PersonMin(
        onTap: () {
          context.push(PMessageView());
        },
        row: RowModel(
          text: therapistName,
          leadingIcon: CustomCircleAvatar(
              big: false, imagePath: imagePath, shadow: false),
          textStyle: AppTextStyles.groupTextStyle(true),
          isAlignmentBetween: true,
        ));
  }
}
