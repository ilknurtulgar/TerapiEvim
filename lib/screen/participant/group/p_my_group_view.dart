import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/custom_heading.dart';
import 'package:terapievim/core/base/component/group/group_box.dart';
import 'package:terapievim/core/base/component/group/person.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/ui_models/row_model.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/message/p_message_view.dart';
import 'package:terapievim/screen/therapist/group/groups_informations/t_profile_about_view.dart';
import '../../../controller/participant/group/p_group_controller.dart';
import '../../../core/base/component/app_bar/my_app_bar.dart';
import '../../../core/base/util/base_model.dart';
import '../../../core/base/util/text_utility.dart';
import '../../../core/base/view/base_view.dart';

class PMyGroupView extends StatelessWidget {
  const PMyGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PGroupController>(
      getController: PGroupController(),
      onModelReady: (model) {},
      onPageBuilder: (context, controller) => Scaffold(
        appBar: MyAppBar(title: GroupTextUtil.myGroupText),
        body: SafeArea(
          child: ListView(
            padding: AppPaddings.pagePadding,
            children: [
              CustomHeading(
                  isalignmentstart: true,
                  text: GroupTextUtil.upcomingMeetingText),
              ActivityBox(
                  onButtonTap: () {},
                  istwobutton: false,
                  buttonText: GroupTextUtil.joinText,
                  isactivity: false,
                  containerModel: AppContainers.containerButton(false),
                  arowModel: DemoInformation.row,
                  ayrowwModel: DemoInformation.row,
                  clockModel: DemoInformation.row),
              CustomHeading(
                text: GroupTextUtil.groupsInformationText,
                isalignmentstart: true,
              ),
              therapist(DemoInformation.row, () {
                context.push(const TProfileView(isSecTherapist: false));
              }),
              therapist(UiBaseModel.messageToTherapist,
                  () => context.push(PMessageView())),
              therapist(DemoInformation.row2, () {
                context.push(const TProfileView(isSecTherapist: true));
              }),
              CustomHeading(
                text: GroupTextUtil.participantsText,
                isalignmentstart: true,
              ),
              participants(DemoInformation.person),
            ],
          ),
        ),
      ),
    );
  }

  PersonMin therapist(RowModel row, Function() fun) {
    return PersonMin(
      onTap: fun,
      row: row,
      isBorderPurple: true,
    );
  }

  ListView participants(RowModel person) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DemoInformation.tmpParticipantNumber,
      itemBuilder: ((context, index) => DemoInformation.tmpParticipant),
    );
  }
}








// class MyGroup extends StatelessWidget {
//   const MyGroup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: AppPaddings.pagePadding,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 rowView(UiBaseModel.appBar(), AppPaddings.appBarPadding),
//                 CustomHeading(
//                     isalignmentstart: true,
//                     text: GroupTextUtil.upcomingMeetingText),
//                 ActivityBox(
//                     istwobutton: false,
//                     buttonText: GroupTextUtil.joinText,
//                     isactivity: false,
//                     containerModel: AppContainers.containerButton(false),
//                     arowModel: DemoInformation.row,
//                     ayrowwModel: DemoInformation.row,
//                     clockModel: DemoInformation.row),
//                 CustomHeading(
//                   text: GroupTextUtil.groupsInformationText,
//                   isalignmentstart: true,
//                 ),
//                 therapist(DemoInformation.row, () {
//                   context.push(const TherapistProfile(isSecTherapist: false));
//                 }),
//                 therapist(UiBaseModel.messageToTherapist,
//                     () => context.push(MessageScreen())),
//                 therapist(DemoInformation.row2, () {
//                   context.push(const TherapistProfile(isSecTherapist: true));
//                 }),
//                 CustomHeading(
//                   text: GroupTextUtil.participantsText,
//                   isalignmentstart: true,
//                 ),
//                 participants(DemoInformation.person),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   PersonMin therapist(RowModel row, Function() fun) {
//     return PersonMin(
//       onTap: fun,
//       row: row,
//       isBorderPurple: true,
//     );
//   }

//   ListView participants(RowModel person) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: DemoInformation.tmpParticipantNumber,
//       itemBuilder: ((context, index) => DemoInformation.tmpParticipant),
//     );
//   }
// }
