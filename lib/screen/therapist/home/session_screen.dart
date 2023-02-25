import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/activtiy/drop_down.dart';
import 'package:terapievim/core/base/component/home/participant_with_sc_time.dart';
import 'package:terapievim/screen/participant/home/home.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: headingtext(false, false, "15 Dakikalık Seanslarım"),
              ),
              const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: CustomDropDown(purpose: "order"),
                  )),
              ListView.builder(
                itemBuilder: (context, index) {
                  return participantWihtShortCallTime(
                      copingList[index], "19.02.2023");
                },
                itemCount: copingList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> copingList = ["Simay Kara", "İlknur Kara", "Gizem Kara"];
