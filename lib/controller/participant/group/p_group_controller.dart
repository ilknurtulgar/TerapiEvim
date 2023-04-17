import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';

class PGroupController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  var isTrue = true.obs;
  var selectedValue = 2.obs;
  void dropvalue(value) {
    selectedValue.value = value;
  }
  //my group bilgileri alinmali
  //terapist isim yardimci terapist isiim en yakin meeting tarihi ve saati katilimcilarin isimleri ve imageleri
}
