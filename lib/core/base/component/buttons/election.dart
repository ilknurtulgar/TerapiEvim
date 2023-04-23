import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/base_utility.dart';
import '../group/person.dart';

class Election extends StatelessWidget {
  const Election({
    super.key,
    required this.firstRow,
    required this.rows,
    required this.isSelectedValue,
  });

  final List<PersonMin> rows;
  final Widget firstRow;
  final RxBool isSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            firstRow,
            isSelectedValue.value
                ? SizedBox(
                    width: Responsive.width(SizeUtil.hugeValueWidth, context),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => rows[index],
                      itemCount: rows.length,
                      shrinkWrap: true,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}

class UsersListMessage extends StatelessWidget {
  const UsersListMessage(
      {super.key,
      this.rows,
      required this.firstRow,
      required this.isSelectedValue});

  final rows;
  final Widget firstRow;
  final RxBool isSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            firstRow,
            isSelectedValue.value
                ? SizedBox(
                    width: Responsive.width(SizeUtil.hugeValueWidth, context),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => rows[index],
                      itemCount: rows.length,
                      shrinkWrap: true,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }
}
