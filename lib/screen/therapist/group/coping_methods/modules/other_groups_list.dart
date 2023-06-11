part of '../t_new_coping_method_view.dart';

class _OtherGroupsList extends StatelessWidget {
  const _OtherGroupsList({Key? key, required this.controller})
      : super(key: key);
  final TCopingMethodsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.rowViewPadding,
      child: Obx(
        () => ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.otherGroups.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final TGroupModel? otherGroup = controller.otherGroups[index];

            return Obx(
              () => ButtonWithGroupName(
                text: otherGroup?.name ?? EmptyTextUtil.emptyText,
                onTap: (value) => controller.switchButtonFunction(index, value),
                switchButtonValue: controller.isButtonOn[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
