import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

void main() {
  runApp(const TerapiEvim());
}

class TerapiEvim extends StatelessWidget {
  const TerapiEvim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
