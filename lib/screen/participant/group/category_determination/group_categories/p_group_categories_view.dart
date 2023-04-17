import 'package:flutter/material.dart';
import 'package:terapievim/controller/participant/group/p_group_category_controller.dart';
import 'package:terapievim/core/base/component/group/group_info_container.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../../core/base/util/base_utility.dart';
import '../../../../../core/base/util/text_utility.dart';

class PGroupCategoriesView extends StatefulWidget {
  const PGroupCategoriesView({super.key});

  @override
  State<PGroupCategoriesView> createState() => _PGroupCategoriesViewState();
}

class _PGroupCategoriesViewState extends State<PGroupCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupCategoryController>(
      getController: PGroupCategoryController(),
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: GroupTextUtil.groupCategoriesHeading),
        body: SafeArea(
          child: Padding(
            padding: AppPaddings.pagePadding,
            child: listOfGroupCategories(controller),
          ),
        ),
      ),
    );
  }

  Widget listOfGroupCategories(PGroupCategoryController controller) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DemoInformation.geciciKategoriSayisi,
      itemBuilder: (context, index) => Padding(
        padding: AppPaddings.componentPadding,
        child: GroupInformationContainer(
            onTap: controller.join,
            groupName: DemoInformation.tmpGroupName,
            mainTherapist: DemoInformation.tmpMainTherapist,
            secondTherapist: DemoInformation.tmpMainTherapist,
            numberOfParticipant: DemoInformation.tmpParticipantNumber,
            numberOfWeek: DemoInformation.tmpCount,
            numberOfSession: DemoInformation.tmpSessionNumber),
      ),
    );
  }
}


//burdan datalari halledecem
