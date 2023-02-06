
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({super.key, this.selectedValue});
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        child: Card(
          child: DropdownButton<int>(
              value: selectedValue,
              hint: Text("seçiniz"),
              items: [
                DropdownMenuItem(
                  child: Text("Yeniden Eskiye"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Eskiden Yeniye "),
                  value: 3,
                ),
              ],
              onChanged: (value) {
                selectedValue = value!;
              }),
        ),
      ),
    ]);
  }
}
