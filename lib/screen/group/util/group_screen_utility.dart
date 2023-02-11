import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../core/base/models/row_model.dart';

class GroupScreenUtility {
  static RowModel therapistRowInChoosingTimeForSCC(String therapistName) =>
      RowModel(
          isAlignmentBetween: false,
          textStyle: AppTextStyles.GroupTextStyle(false),
          text: therapistName,
          leadingIcon: IconUtility.personIcon);
  static RowModel dateRowInChoosingTimeForSCC(String date) => RowModel(
      isAlignmentBetween: false,
      textStyle: AppTextStyles.GroupTextStyle(false),
      text: 'Tarih: $date',
      leadingIcon: IconUtility.calendarIcon);
}

class GroupPaddings {
  static EdgeInsets groupCategoryPadding =
      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24);
  static EdgeInsets appbarPadding =
      const EdgeInsets.only(right: 10.0, left: 10, top: 10);
  static EdgeInsets shortCallHeadingPadding = const EdgeInsets.all(10);
  static EdgeInsets timeChoosePadding =
      const EdgeInsets.symmetric(vertical: 12.0);
  static EdgeInsets timeChossingBetweenPadding =
      const EdgeInsets.only(top: 26, left: 26, right: 26);
  static EdgeInsets customHeadingPadding = const EdgeInsets.only(
    left: 15,
    bottom: 15,
    top: 20,
  );
  static EdgeInsets aboutmePadding = const EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets whitebackgroundmargin = const EdgeInsets.only(bottom: 122);
}
