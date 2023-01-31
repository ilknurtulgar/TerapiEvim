import 'package:flutter/material.dart';

import 'package:terapievim/screen/group/ui/scl90/questions_button.dart';
import 'package:terapievim/components/text/row_text.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ToggleQuestions(), RowText()],
    );
  }
}
