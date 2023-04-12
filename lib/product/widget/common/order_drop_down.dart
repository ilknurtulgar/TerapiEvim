import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../core/base/component/activtiy/drop_down.dart';
import '../../../core/base/util/base_utility.dart';

class OrderDropDown extends StatelessWidget {
  const OrderDropDown(
      {super.key,
      required this.selectedText,
      required this.isBoxSelected,
      required this.onDropDownTapped,
      required this.onValueSelected});
  final RxString selectedText;
  final RxBool isBoxSelected;
  final Function() onDropDownTapped;
  final Function(int) onValueSelected;
  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
      selectedText: selectedText,
      isBoxSelected: isBoxSelected,
      onDropDownTapped: onDropDownTapped,
      onValueSelected: onValueSelected,
      textList: DemoInformation.orderingList,
      height: SizeUtil.smallValueHeight,
      width: SizeUtil.normalValueWidth,
    );
  }
}
