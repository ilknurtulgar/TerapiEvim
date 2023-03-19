import 'package:flutter/material.dart';

import '../../base/util/base_utility.dart';
import '../../extension/context_extension.dart';
import '../../extension/double_extension.dart';

class ResponsivenessManager {
  static ResponsivenessManager? _instance;

  static ResponsivenessManager get instance {
    return _instance ??= ResponsivenessManager._init();
  }

  ResponsivenessManager._init();

  ///Height Factor
  double heightFactor = 1;

  ///Width Factor
  double widthFactor = 1;

  double get heightFactorMax1 => heightFactor > 1 ? 1 : heightFactor;

  double get widthFactorMax1 => widthFactor > 1 ? 1 : widthFactor;

  void setFactorSize(BuildContext context) {
    /// sample width of Iphone Pro Max= 390
    const double sampleWidth = 390;

    /// sample height of Iphone Pro Max= 844
    const double sampleHeight = 844;

    /// Set width  and height factor, since this is first enter
    /// of a context it is initialized here
    widthFactor = (context.width / sampleWidth).roundToPrecision(3);
    heightFactor = (context.height / sampleHeight).roundToPrecision(3);

    ///Don't allow too high width factor
    if (widthFactor > 1.4) {
      widthFactor = 1.4;
    }

    ///Don't allow too high height factor
    if (heightFactor > 1.5) {
      heightFactor = 1.5;
    }

    ///Don't allow too low width factor
    if (widthFactor < 0.6) {
      widthFactor = 0.6;
    }

    ///Don't allow too low height factor
    if (heightFactor < 0.5) {
      heightFactor = 0.5;
    }
    //print('heightFactor:${heightFactor}');
    //print('widthFactorMax1:${widthFactorMax1}');
    SizeUtil.heightFactor = heightFactorMax1.roundToPrecision(3);
    SizeUtil.widthFactor = widthFactorMax1.roundToPrecision(3);
  }
}
