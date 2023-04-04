
import 'package:flutter/material.dart';

import '../../../core/base/ui_models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../product/widget/common/activity/search.dart';

class TMyActivityListView extends StatelessWidget {
  const TMyActivityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Search(
          rowModel: RowModel(
              text: "Ara",
              textStyle: const TextStyle(),
              isAlignmentBetween: false,
              leadingIcon: IconUtility.searchIcon)),
      body: Column(
        children: const [],
      ),
    );
  }
}
