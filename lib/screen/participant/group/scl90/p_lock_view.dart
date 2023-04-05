import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';

import '../../../../core/base/component/group/lock_screen_components.dart';

class PLockView extends StatelessWidget {
  const PLockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const PMyGroupView(),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          const PopUp()
        ],
      ),
    );
  }
}
