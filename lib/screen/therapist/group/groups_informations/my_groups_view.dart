import 'package:flutter/material.dart';
import 'package:terapievim/controller/therapist_group_controller.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/core/base/view/base_view.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/therapist/group/group_add/group_add_view.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/group_information.dart';

import '../../../../core/base/component/group/group.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({super.key}); //gecici modeller

  @override
  Widget build(BuildContext context) {
    return BaseView<TherapistGroupController>(
        getController: TherapistGroupController(),
        onModelReady: (model) {},
        onPageBuilder: (context, controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppPaddings.pagePadding,
                  child: Column(
                    children: [
                      rowView(
                          RowModel(
                              text: GroupTextUtil.myGroupsText,
                              textStyle: AppTextStyles.heading(true),
                              isAlignmentBetween: true,
                              trailingIcon: IconButton(
                                  onPressed: () {
                                    context.push(const GroupAddView());
                                  },
                                  icon: IconUtility.addIcon)),
                          AppPaddings.appBarPadding),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GroupClass(
                            onTap: () {
                              context.push(GroupInformation());
                            },
                            row1: DemoInformation.row_1,
                            row2: DemoInformation.row_2,
                            row3: DemoInformation.row_3,
                            isBorderPurple: true,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}




// class MyGroups extends StatelessWidget {
//   const MyGroups({super.key}); //gecici modeller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: AppPaddings.pagePadding,
//             child: Column(
//               children: [
//                 rowView(
//                     RowModel(
//                         text: GroupTextUtil.myGroupsText,
//                         textStyle: AppTextStyles.heading(true),
//                         isAlignmentBetween: true,
//                         trailingIcon: IconButton(
//                             onPressed: () {
//                               context.push(const GroupAddView());
//                             },
//                             icon: IconUtility.addIcon)),
//                     AppPaddings.appBarPadding),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return GroupClass(
//                       onTap: () {
//                         context.push(GroupInformation());
//                       },
//                       row1: DemoInformation.row_1,
//                       row2: DemoInformation.row_2,
//                       row3: DemoInformation.row_3,
//                       isBorderPurple: true,
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
