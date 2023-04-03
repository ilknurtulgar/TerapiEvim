import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/participant/last_review_controller.dart';
import '../../../core/base/component/group/row_view.dart';
import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class LastReview extends StatelessWidget {
  LastReview({super.key});
  LastReviewController controller = Get.put(LastReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueChalk,
        title: rowView(
            RowModel(
                text: "Incelediklerim",
                textStyle: AppTextStyles.heading(false),
                isAlignmentBetween: true),
            AppPaddings.appBarPadding),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: AppPaddings.pagePaddingHorizontal,
            sliver: SliverToBoxAdapter(
              child: dropDown(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: AppPaddings.pagePaddingHorizontal,
                child: DemoInformation.demoLAstReviewContainer,
              ),
              childCount: 10,
            ),
          ),
        ],
      )),
    );
  }

  Align dropDown() {
    return Align(
      alignment: Alignment.topRight,
      child: Obx(
        () => DropdownButton<String>(
          underline: const SizedBox.shrink(),
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          value: controller.dropdownValue.value,
          icon: IconUtility.arrowDown,
          elevation: 16,
          style: AppTextStyles.aboutMeTextStyle(false),
          borderRadius: AppBorderRadius.generalBorderRadius,
          onChanged: (String? value) {
            if (value != null) {
              controller.changeDropDown(value);
            }
          },
          items: controller.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
