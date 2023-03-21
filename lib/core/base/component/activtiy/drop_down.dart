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
    this.textController,
  });

  final double width;
  final double height;
  final bool isGenderPurpose;
  final TextEditingController? textController;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SizedBox(
        width: Responsive.width(widget.width, context),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                activityController.changeBox();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: AppBoxDecoration.purpleBorder,
                height: widget.height,
                width: Responsive.width(widget.width, context),
                child: Obx(() => textpurpose(widget.isGenderPurpose
                    ? activityController.gender.value
                    : activityController.order.value)),
              ),
            ),
            Obx(
              () => activityController.selectedBox.value
                  ? ChooseGender(
                      widget: widget,
                      textController: widget.textController,
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
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
    this.textController,
  });

  final CustomDropDown widget;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.purpleBorder,
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
                  widget.isGenderPurpose,
                  textController);
              activityController.changeBox();
            },
            child: Padding(
              padding: AppPaddings.componentPadding,
              child: Text(
                widget.isGenderPurpose
                    ? DemoInformation.genderList[index]
                    : DemoInformation.orderingList[index],
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
