import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.width,
    required this.height,
    required this.orderText,
    // required this.widget,
    required this.textList,
    required this.isBoxSelected,
    required this.onDropDownTapped,
  });

  final double width;
  final double height;
  final bool isBoxSelected;

  final List<String> textList;
  final Function() onDropDownTapped;

  // final Widget widget;
  final RxString orderText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.componentPadding,
      child: SizedBox(
        width: Responsive.width(width, context),
        child: Column(
          children: [
            InkWell(
              onTap: onDropDownTapped,
              child: Container(
                  alignment: Alignment.center,
                  decoration: AppBoxDecoration.purpleBorder,
                  height: height,
                  width: Responsive.width(width, context),
                  child: Obx(() => Text(orderText.value))),
            ),
            isBoxSelected
                ? _DropDownList(
                    orderString: orderText,
                    textList: textList,
                  )
                : const SizedBox.shrink(),
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

class _DropDownList extends StatelessWidget {
  const _DropDownList({
    required this.orderString,
    required this.textList,
  });

  final List<String> textList;
  final RxString orderString;

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
            onTap: () {
              orderString.value = textList[index];
            },
            child: Padding(
                padding: AppPaddings.componentPadding,
                child: Text(
                  textList[index],
                  textAlign: TextAlign.center,
                )),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
//
// Widget columnDropDown(String title, bool isInProfilePage,
//     [RxString? rxString]) {
//   return Column(
//     children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: responsivenestext(
//           title,
//           AppTextStyles.normalTextStyle("medium", false),
//         ),
//       ),
//       CustomDropDown(
//         textList: DemoInformation.genderList,
//         isBoxSelected: false,
//         widget: textpurpose(profileController.genders.value),
//         onDropDownTapped: () {
//           profileController.func(DemoInformation.genderList, rxString);
//         },
//         width: isInProfilePage
//             ? SizeUtil.highestValueWidth
//             : SizeUtil.generalWidth,
//         height:
//             isInProfilePage ? SizeUtil.lowValueHeight : SizeUtil.generalHeight,
//         textController: rxString,
//       )
//     ],
//   );
// }
