import 'package:flutter/cupertino.dart';
import 'package:terapievim/core/base/component/buttons/switch_button.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ButtonWithGroupName extends StatelessWidget {
  const ButtonWithGroupName({super.key,
  required this.text,
  required this.onTap,
  required this.switchButtonValue,
  });
  final String text;
  final void Function(bool) onTap;
  final bool switchButtonValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: AppTextStyles.buttonTextStyle(AppColors.black)),
          SwitchButton(onTap: onTap, value: switchButtonValue),
        ],
      ),
    );
  }
}
