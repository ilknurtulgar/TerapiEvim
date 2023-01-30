import 'package:flutter/cupertino.dart';

class RowText extends StatelessWidget {
  RowText({
    super.key,
  });
  int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(rowText.toString())],
    );
  }
}

void selection(int index) {
  for (var element in rowText) {
    Text(rowText.toString());
  }
}

List<String> rowText = <String>["hiç", "çok az", "orta", "fazla", "aşırı"];
