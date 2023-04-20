import 'package:flutter/material.dart';
import 'package:terapievim/product/widget/common/order_drop_down.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';
import '../../../controller/participant/profil/p_attended_seminars_controller.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/component/profile/container/two_row_short_container.dart';
import '../../../core/base/util/base_utility.dart';

// ignore: must_be_immutable
class PAttendedSeminarsView extends StatelessWidget {
  const PAttendedSeminarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PAttendedSeminarsController>(
      getController: PAttendedSeminarsController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: ParticipantProfileTextUtil.attendedSeminar),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppPaddings.pagePaddingHorizontal,
              sliver: SliverToBoxAdapter(child: _orderdropdown(controller)),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: AppPaddings.pagePaddingHorizontal,
                  child: TwoRowShortContainer(
                    row1Text: controller.listOfActivities.getTherapistNames[index],
                    row2Text: controller.listOfActivities.getTitles[index],
                    firstIconData: IconUtility.personIcon.icon!,
                    secondIconData: IconUtility.windowsIcon.icon!,
                    purpose: ContainerPurpose.seminar,
                    buttonText: ParticipantProfileTextUtil.watchAgain,
                    firstOnTap: () {
                      
                    },
                  ),
                ),
                childCount: controller.listOfActivities.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _orderdropdown(PAttendedSeminarsController controller) {
  return OrderDropDown(
    selectedText: controller.orderValue,
    isBoxSelected: controller.isBoxSelected,
    onDropDownTapped: () {
      controller.setIsBoxSelected();
    },
    onValueSelected: (int index) {
      print('index:${index}');
    },
  );
}
