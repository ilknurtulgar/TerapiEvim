import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.loginText}) : super(key: key);
  String? loginText;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              labelText: loginText,
              hintText: "abcdef@gmail.com",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ));
  }
}
