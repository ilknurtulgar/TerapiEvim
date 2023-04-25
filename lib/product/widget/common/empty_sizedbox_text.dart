import 'package:flutter/material.dart';

class EmptySizedBoxText extends StatelessWidget {
  const EmptySizedBoxText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        child: Text(
          "Bu kısımda veri bulunmamaktadır.",
        ),
      ),
    );
  }
}
