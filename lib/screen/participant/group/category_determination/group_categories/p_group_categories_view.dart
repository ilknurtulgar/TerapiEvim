import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/group/p_group_category_controller.dart';
import 'package:terapievim/core/base/component/group/group_info_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/model/therapist/group/t_group_model.dart';
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
                    onTap: controller.join,
                    groupName: group.name!,
                    mainTherapist: therapists(DemoInformation.imagePath,
                        DemoInformation.therapistName),
                    secondTherapist: therapists(DemoInformation.imagePath,
                        DemoInformation.therapistName2),
                    numberOfParticipant: group.participantNumber ?? 0,
                    numberOfWeek: DemoInformation.tmpCount,
                    numberOfSession: DemoInformation.tmpSessionNumber),
          );
        },
      ),
    );
  }

  CardModel therapists(String imagePath, String name) =>
      CardModel(imagePath: imagePath, title: name);
}

//burdan datalari halledecem
