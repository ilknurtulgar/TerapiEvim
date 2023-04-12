import 'package:flutter/src/widgets/framework.dart';
import '../../../../core/base/component/group/row_view.dart';
import '../../../../core/base/ui_models/row_model.dart';
import '../../../../core/base/util/base_utility.dart';

class MiniHeading extends StatelessWidget {
  const MiniHeading(
      {super.key,
      required this.name,
      required this.isInMiddle,
      required this.isAlignedInCenter});
  final String name;
  final bool isInMiddle;
  final bool isAlignedInCenter;

  @override
  Widget build(BuildContext context) {
    return RowView(
        rowModel: RowModel(
            text: name,
            textStyle: AppTextStyles.heading(false),
            isAlignmentBetween: isAlignedInCenter),
        padding: AppPaddings.miniHeadingPadding(isInMiddle));
  }
}
