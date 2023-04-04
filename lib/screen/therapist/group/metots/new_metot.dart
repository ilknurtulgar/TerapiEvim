import 'package:flutter/material.dart';

import '../../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../../core/base/component/group/button_group_name_row.dart';
import '../../../../core/base/component/group/custom_heading.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';
import '../../../../core/base/util/text_utility.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../screen/therapist/activity/companent/coping_box.dart';

class NewMetot extends StatelessWidget {
  const NewMetot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: GroupTextUtil.metotText),
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              heading(context),
              CopingBox(
                  copingtext: DemoInformation.tmpNewMetotText,
                  pdfname: DemoInformation.tmppdfName),
              text(),
              otherGroups(),
            ],
          ),
        ),
      ),
    );
  }

  Padding text() {
    return Padding(
      padding: AppPaddings.miniHeadingPadding(false),
      child: CustomHeading(
          text: GroupTextUtil.shareOtherGroupsText, isalignmentstart: false),
    );
  }

  Padding otherGroups() {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: ListView.builder(
        itemCount: DemoInformation.groupNames.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => ButtonWithGroupName(
            text: DemoInformation.groupNames[index], index: index),
      ),
    );
  }

  Widget heading(BuildContext context) {
    return rowView(
        RowModel(
            text: GroupTextUtil.metotText,
            textStyle: AppTextStyles.heading(false),
            trailingIcon: IconButton(
              icon: IconUtility.deleteIcon,
              onPressed: () {
                deleteMetotDialog(context);
                context.pop();
              },
            ),
            isAlignmentBetween: true),
        AppPaddings.appBarPadding);
  }

  Future<void> deleteMetotDialog(BuildContext context) {
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
                context.pop();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
