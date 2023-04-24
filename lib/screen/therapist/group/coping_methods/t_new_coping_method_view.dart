import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/therapist/group/coping_method/coping_method_controller.dart';
import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/group/button_group_name_row.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../model/therapist/group/t_group_model.dart';
import '../../../../product/widget/common/group/coping_box.dart';
import '../t_my_groups_view.dart';

part 'modules/other_groups_list.dart';

class TNewCopingMethodView extends StatelessWidget {
  TNewCopingMethodView({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BaseView<TCopingMethodsController>(
      getController: TCopingMethodsController(),
      onModelReady: (model) {
        model.setContext(context);
        model.setCurrentGroupId(groupId);
      },
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(
          title: GroupTextUtil.metotText,
          actions: _popButton(context),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: AppPaddings.pagePadding,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CopingBox(
                          subjectTitleTextController:
                              controller.subjectTitleEditingController,
                          copingText: DemoInformation.tmpNewMetotText,
                          pdfName: DemoInformation.tmppdfName,
                          onAddTapped: () async {
                            await controller.pickPdf();
                          },
                          onShareTapped: () async {
                            await controller.shareCopingMethod();
                          },
                        ),
                        _OtherGroupsList(controller: controller),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  List<Widget> _popButton(BuildContext context) {
    return [
      IconButton(
        icon: IconUtility.deleteIconOutlined,
        onPressed: () {
          deleteMethodDialog(context);
          context.pop();
        },
      )
    ];
  }

  Padding text() {
    return Padding(
      padding: AppPaddings.miniHeadingPadding(false),
      child: CustomHeading(
          text: GroupTextUtil.shareOtherGroupsText, isalignmentstart: false),
    );
  }

  Widget heading(BuildContext context) {
    return RowView(
        rowModel: RowModel(
            text: GroupTextUtil.metotText,
            textStyle: AppTextStyles.heading(false),
            trailingIcon: IconButton(
              icon: IconUtility.deleteIcon,
              onPressed: () {
                deleteMethodDialog(context);
                context.pop();
              },
            ),
            isAlignmentBetween: true),
        padding: AppPaddings.appBarPadding);
  }

  Future<void> deleteMethodDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(GroupTextUtil.deleteMetotText),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(GroupTextUtil.deleteMetotWarningText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(GroupTextUtil.cancelText),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: Text(GroupTextUtil.deleteText),
              onPressed: () {
                context.pushAndRemoveUntil(TMyGroupsView());
              },
            ),
          ],
        );
      },
    );
  }
}
