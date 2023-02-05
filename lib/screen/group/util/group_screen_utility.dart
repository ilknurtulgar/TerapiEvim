import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../models/row_model.dart';

class GroupScreenUtility{
  static RowModel therapistRowInChoosingTimeForSCC(String therapistName) => RowModel(
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