import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/activity/filter_details_view.dart';

import '../../../core/base/component/activtiy/filtermin.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPaddings.pagePadding,
          child: Column(
            children: [
              filterappbar(context),
              filtermin(ActivityTextUtil.psychologist, () {
                context.push(FilterDetailsView());
              }, IconUtility.forward),
              filtermin(ActivityTextUtil.date, () {}, IconUtility.forward),
              filtermin(ActivityTextUtil.issue, () {}, IconUtility.forward),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterappbar(BuildContext context) {
    return rowView(
        UiBaseModel.secRowModel(
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      ActivityTextUtil.clean,
                      style: AppTextStyles.normalTextStyle("small", false),
                    )),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: IconUtility.closeIcon)
              ],
            ),
            ActivityTextUtil.filtering),
        AppPaddings.componentPadding);
    /* Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          ActivityTextUtil.filtering,
          textAlign: TextAlign.start,
          style: AppTextStyles.normalTextStyle("big", false),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  ActivityTextUtil.clean,
                  style: AppTextStyles.normalTextStyle("small", false),
                )),
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: IconUtility.closeIcon)
          ],
        ),
      ],
    );*/
  }
}
