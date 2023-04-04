import 'package:flutter/material.dart';

import '../../../core/base/models/row_model.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../screen/participant/activity/search.dart';

class TMyActivityListPage extends StatelessWidget {
  const TMyActivityListPage({super.key});

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
