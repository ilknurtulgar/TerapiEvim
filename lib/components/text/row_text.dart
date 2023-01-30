import 'package:flutter/cupertino.dart';

class RowText extends StatelessWidget {
  RowText({
    super.key,
  });
  int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: ListView(
            children: List.generate(
                rowText.length, (index) => Text(index.toString())),
          ),
        )
      ],
    );
  }
}

void change(int index) {
  while (rowText[index] == rowText[index]) {
    Text(rowText.reversed.toString());
  }
}

List<String> rowText = <String>["hiç", "çok az", "orta", "fazla", "aşırı"];
