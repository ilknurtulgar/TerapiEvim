import 'package:flutter/material.dart';
import 'package:terapievim/screen/participant/group/my_group.dart';

import '../../../../core/base/component/group/lock_screen_components.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const MyGroup(),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          const PopUp()
        ],
      ),
    );
  }
}
