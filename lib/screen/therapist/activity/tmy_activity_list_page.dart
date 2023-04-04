import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/activity/search.dart';

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
                leadingIcon: IconUtility.searchIcon)));
  }
}
