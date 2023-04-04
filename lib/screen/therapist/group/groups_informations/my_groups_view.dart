import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/app_bar/my_app_bar.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/group_information.dart';

import '../../../../core/base/component/group/group.dart';
import '../../../../service/model/therapist/group/t_group_model.dart';
import '../group_add/group_add_view.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({super.key}); //gecici modeller

  @override
  Widget build(BuildContext context) {
    return BaseView<TherapistGroupController>(
        getController: TherapistGroupController(),
        onPageBuilder: (context, controller) {
          return Scaffold(
            appBar: MyAppBar(
              title: GroupTextUtil.myGroupsText,
              actions: [
                IconButton(
                    onPressed: () {
                      context.push(const GroupAddView());
                    },
                    icon: IconUtility.addIcon),
              ],
            ),
            body: SafeArea(
              child: Obx(
                () => ListView.builder(
                  padding: AppPaddings.pagePadding,
                  itemCount: controller.fetchedGroups.length,
                  itemBuilder: (context, index) {
                    final TGroupModel? group = controller.fetchedGroups[index];
                    return GroupClass(
                      onTap: () {
                        context.push(GroupInformation());
                      },
                      row1: DemoInformation.groupTitle(group?.name ?? ''),
                      row2: DemoInformation.row_2,
                      row3: DemoInformation.row_3,
                      isBorderPurple: true,
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
