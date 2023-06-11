import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/t_group_information_view.dart';

import '../../../controller/therapist/group/t_group_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/group/group.dart';
import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../model/therapist/group/t_group_model.dart';
import 'group_add/t_group_add_view.dart';

class TMyGroupsView extends StatelessWidget {
  const TMyGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TGroupController>(
        getController: TGroupController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              title: GroupTextUtil.myGroupsText,
              actions: [
                IconButton(
                    onPressed: () {
                      context.push(TGroupAddView());
                    },
                    icon: IconUtility.addcircleIcon),
              ],
            ),
            body: Obx(
              () => ListView.builder(
                padding: AppPaddings.pagePadding,
                itemCount: controller.fetchedGroups.length,
                itemBuilder: (context, index) {
                  final TGroupModel group = controller.fetchedGroups[index]!;
                  return GroupClass(
                    onTap: () {
                      context.push(TGroupInformationView(currentGroup: group));
                    },
                    row1: rows(group.name ?? EmptyTextUtil.emptyText,
                        IconUtility.activityIcon),
                    row2: rows(
                        GroupTextUtil.secondTherapistText +
                            (group.therapistHelperName ??
                                EmptyTextUtil.emptyText),
                        IconUtility.personIcon),
                    row3: rows(group.groupCategory ?? EmptyTextUtil.emptyText,
                        IconUtility.groupsIcon),
                    isBorderPurple: true,
                  );
                },
              ),
            ),
          );
        });
  }

  RowModel rows(String name, Icon icon) {
    return RowModel(
      leadingIcon: icon,
      isAlignmentBetween: false,
      text: name,
      textStyle: AppTextStyles.groupTextStyle(true),
    );
  }
}
