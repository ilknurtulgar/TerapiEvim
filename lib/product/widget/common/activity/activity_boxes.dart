import 'package:flutter/material.dart';

import '../../../../core/base/component/group/group_box.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

Widget activityThreeRowBox(
    Function() onButtonTap,
    Function()? onTap,
    RowModel arrowModel,
    RowModel clockModel,
    String buttonText,
    RowModel ayrowModel) {
  return ActivityBox(
      ayrowwModel: ayrowModel,
      onTap: onTap,
      istwobutton: false,
      buttonText: buttonText,
      containerModel: AppContainers.containerButton(false),
      arowModel: arrowModel,
      isactivity: false,
      clockModel: clockModel,
      rightButtonTap: onButtonTap);
}
