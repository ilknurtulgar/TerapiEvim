import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_group_category_controller.dart';
import 'package:terapievim/core/base/component/group/group_info_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../../core/base/ui_models/card_model.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../../../../core/base/util/text_utility.dart';
import '../../../../../model/participant/group/joinable_group_model.dart';

class PGroupCategoriesView extends StatelessWidget {
  const PGroupCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupCategoryController>(
      onModelReady: (controller) {
        controller.setContext(context);
      },
      getController: PGroupCategoryController(),
      onPageBuilder: (context, controller) => Scaffold(
          appBar: MyAppBar(title: GroupTextUtil.groupCategoriesHeading),
          body: listOfGroupCategories(controller)),
    );
  }

  Widget listOfGroupCategories(PGroupCategoryController controller) {
    return Obx(
      () => ListView.builder(
        padding: AppPaddings.pagePadding,
        itemCount: controller.groups.length,
        itemBuilder: (context, index) {
          final JoinableGroupModel group = controller.groups[index];
          return Padding(
            padding: AppPaddings.componentPadding,
            child: controller.groups.isEmpty
                ? Text("Grup yok")
                : GroupInformationContainer(
                    onTap: () => controller.join(group.id!),
                    groupName: group.name!,
                    mainTherapist: therapists(group.therapistImageUrl ?? "",
                        group.therapistName ?? "yok"),
                    secondTherapist: therapists(
                        group.therapistHelperImageUrl ?? "",
                        group.therapistHelperName ?? "yok"),
                    numberOfParticipant: group.participantNumber ?? 0,
                    numberOfWeek: group.numberOfWeeks ?? 0,
                    numberOfSession: group.numberOfSessions ?? 0),
          );
        },
      ),
    );
  }

  CardModel therapists(String imagePath, String name) =>
      CardModel(imagePath: imagePath, title: name);
}

//burdan datalari halledecem
