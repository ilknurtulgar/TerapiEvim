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
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              final TGroupModel groupModel = controller.groups[index];
              return Padding(
                padding: AppPaddings.componentPadding,
                child: UsersListMessage(
                    isSelectedValue: controller.isOpen[index],
                    firstRow: Container(
                      width: SizeUtil.generalWidth,
                      height: SizeUtil.normalValueHeight,
                      decoration: AppBoxDecoration.sendDecoration,
                      child: InkWell(
                        onTap: () => controller.onPersonListChange(index),
                        child: RowView(
                            rowModel: UiBaseModel.personviewRowModel(
                                groupModel.name ?? "empty groupname",
                                controller,
                                index),
                            padding: AppPaddings.generalPadding),
                      ),
                    ),
                    rows:
                        PersonList(controller: controller, groupIndex: index)),
              );
            },
            itemCount: controller.groups.length,
          ),
        ),
      ),
    );
  }

  List<PersonMin> person(BuildContext context, TGroupModel groupModel,
      TMessageAllUsersListController controller) {
    final List<PersonMin> personMinList = [];
    /*   for (UserModel user in listOfUsers) {
      personMinList
          .add(chatPerson(user.name ?? "", context, user.imageUrl ?? ""));
    }*/
    return personMinList;
  }
}

PersonMin chatPerson(
    String therapistName, BuildContext context, String imagePath) {
  return PersonMin(
      onTap: () {
        context.push(PMessageView());
      },
      row: RowModel(
        text: therapistName,
        leadingIcon:
            CustomCircleAvatar(big: false, imagePath: imagePath, shadow: false),
        textStyle: AppTextStyles.groupTextStyle(true),
        isAlignmentBetween: true,
      ));
}

class PersonList extends StatelessWidget {
  const PersonList(
      {super.key, required this.controller, required this.groupIndex});
  final TMessageAllUsersListController controller;
  final int groupIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final List<UserModel> listOfUsers =
            controller.groupUsers[controller.groupIds[index]]!;

        return; // chatPerson(user.name ?? "", context, user.imageUrl ?? "");
      },
      itemCount: controller.groupUsers.length,
    );
  }
}
