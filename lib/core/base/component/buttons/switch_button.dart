import 'package:flutter/cupertino.dart';
import '../../util/base_utility.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.onTap, required this.value});
  final void Function(bool) onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return  CupertinoSwitch( // obx e burada sarınca hata geliyor o yüzden kullanılan yerde switch button'ı obx ile sarmayı unutmayın
          activeColor: AppColors.white,
          trackColor: AppColors.white,
          thumbColor: AppColors.butterflyBush,
          value: value,
          onChanged: onTap,
    );
  }
}
