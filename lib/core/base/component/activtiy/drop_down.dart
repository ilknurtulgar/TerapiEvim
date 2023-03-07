import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/login/custom_textfield.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.isGenderPurpose,
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final bool isGenderPurpose;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              print("ben çalışmıyorum kanka");
              activityController.changeBox();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: AppBoxDecoration.lockScreenBox,
              height: widget.height,
              width: widget.width,
              child: Obx(() => textpurpose(widget.isGenderPurpose
                  ? activityController.gender.value
                  : activityController.order.value)),
            ),
          ),
          Obx(
            () => activityController.selectedBox.value
                ? ChooseGender(widget: widget)
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  Widget textpurpose(property) {
    return Text(
      property,
    );
  }
}

class ChooseGender extends StatelessWidget {
  const ChooseGender({
    super.key,
    required this.widget,
  });

  final CustomDropDown widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.lockScreenBox,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              activityController.func(
                  widget.isGenderPurpose
                      ? DemoInformation.genderList[index]
                      : DemoInformation.orderingList[index],
                  widget.isGenderPurpose);
              print(index);
              activityController.changeBox();
              print("tıklandı");
            },
            child: Text(
              widget.isGenderPurpose
                  ? DemoInformation.genderList[index]
                  : DemoInformation.orderingList[index],
              textAlign: TextAlign.center,
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
