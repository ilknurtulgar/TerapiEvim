import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.width,
    required this.height,
    this.textController,
    required this.widget,
    required this.textlist,
    required this.ontap,
  });

  final double width;
  final double height;

  final List<String> textlist;
  final Function()? ontap;

  final Widget widget;
  final TextEditingController? textController;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

ActivityController activityController = Get.find();

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
                print("heree");
                activityController.changeBox();
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: AppBoxDecoration.purpleBorder,
                  height: widget.height,
                  width: Responsive.width(widget.width, context),
                  child: widget.widget),
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
}

Widget textpurpose(property) {
  return Text(
    property,
  );
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
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: widget.ontap,
            child: Padding(
                padding: AppPaddings.componentPadding,
                child: Text(
                  widget.textlist[index],
                  textAlign: TextAlign.center,
                )),
          );
        },
        itemCount: 2,
      ),
    );
  }
}

/*() {
              activityController.func(
                  widget.isGenderPurpose
                      ? DemoInformation.genderList[index]
                      : DemoInformation.orderingList[index],
                  widget.isGenderPurpose,
                  textController);
              activityController.changeBox();
            },
            
            */
        