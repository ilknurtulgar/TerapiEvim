import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
class ButtonWithGroupName extends StatelessWidget {
  ButtonWithGroupName({super.key, required this.text,required this.index});
  final String text;
  final int index;
  final TherapistGroupController controller = Get.put(TherapistGroupController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: Center(
        child: SizedBox(
          width: 305,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500,color: AppColors.black),),
              switchButton(),
            ],
          ),
        ),
      ),
    );
  }

  Obx switchButton() {
    return Obx(() => CupertinoSwitch(
                activeColor: AppColors.white,
                trackColor: AppColors.white,
                thumbColor:AppColors.butterflyBush ,
                value: controller.isButtonOn[index],
                onChanged: (value) => controller.switchButtonFunction(index, value)),
          );
  }
}
