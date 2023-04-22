import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/screen/participant/group/category_determination/short_call/p_determining_to_shortcall_time_view.dart';

import '../../../model/common/scl_90/scl_90_result_model.dart';
import '../../../model/participant/scl90test/answers.dart';
import '../../../service/_participant/scl_90/i_p_scl_90_service.dart';
import '../../../service/_participant/scl_90/p_scl_90_service.dart';
import '../../base/base_controller.dart';
import '../participant_controller.dart';

//answer doldur
class PTestQuestionsController extends GetxController with BaseController {
  @override
  void onInit() {
    super.onInit();
    pScl90Service = PScl90Service(vexaFireManager.networkManager);
  }

  @override
  void setContext(BuildContext context) => controllerContext = context;

  late final IPScl90Service pScl90Service;

  RxInt testPageIndex = 0.obs;
  RxInt questionIndex = 0.obs;
  List<List<bool>> list =
      List.generate(90, ((index) => [false, false, false, false, false])).obs;
  List<int> answer =
      List.generate(90, (index) => (-1)); //sonuclari almam gerekiyor nasil
  List<Answers> answers = [];

  //test sonucunun cikmasi icin indeks dizileri
  List<int> somatizationIndex = [0, 3, 11, 26, 39, 41, 47, 51, 52, 55, 57];
  List<int> oKBIndex = [2, 8, 9, 27, 37, 44, 45, 50, 54, 64];
  List<int> interpersonalSensitivityIndex = [5, 20, 33, 35, 36, 40, 60, 68, 72];
  List<int> depressionIndex = [
    4,
    13,
    14,
    19,
    21,
    25,
    28,
    29,
    30,
    31,
    53,
    70,
    78
  ];
  List<int> anxietyIndex = [1, 16, 22, 32, 38, 56, 71, 77, 79, 85];
  List<int> angerEnmityIndex = [10, 23, 62, 66, 73, 80];
  List<int> phobicAnxietyIndex = [12, 24, 46, 49, 69, 74, 81];
  List<int> paranoidThoughtsIndex = [7, 17, 42, 67, 75, 82];
  List<int> psychoticismIndex = [6, 15, 34, 61, 76, 83, 84, 86, 87, 89];
  List<int> additionalScalesIndex = [18, 43, 58, 59, 63, 65, 88];

  Future<void> submit(Scl90ResultModel model) async {
    final NavigatorState navigator = Navigator.of(controllerContext);

    //  Scl90ResultModel scl90Result = Scl90ResultModel();

    final idResponse = await pScl90Service.submitTest(model);

    if (idResponse != null) {
      localManager.setBoolValue(LocalManagerKeys.pIsScl90Submitted, true);
      final ParticipantController pController=Get.find();
      pController.isScl90Submitted.value=true;

      navigationManager.pushAndRemoveUntil(navigator, PShortCallTimeView());
    } else {
      flutterErrorToast("submit olamadi");
    }
  }

  void symptomIdentification() {
    //Somatizasyon
    double somatizationResult = transactions(somatizationIndex);
    double oKBResult = transactions(oKBIndex);
    double interpersonalSensitivityResult =
        transactions(interpersonalSensitivityIndex);
    double depressionResult = transactions(depressionIndex);
    double anxietyResult = transactions(anxietyIndex);
    double angerEnmityResult = transactions(angerEnmityIndex);
    double phobicAnxietyResult = transactions(phobicAnxietyIndex);
    double paranoidThoughtResult = transactions(paranoidThoughtsIndex);
    double psychoticismResult = transactions(psychoticismIndex);
    double additionalScalesResult = transactions(additionalScalesIndex);
    print("soma ${somatizationResult}");
    print("okb $oKBResult");
    print("inter $interpersonalSensitivityResult");
    print("dep $depressionResult");
    print("anx ${anxietyResult}");
    print("anger $angerEnmityResult");
    print("phobic ${phobicAnxietyResult}");
    print("para $paranoidThoughtResult");
    print("psycho ${psychoticismResult}");
    print("add $additionalScalesResult");

    submit(Scl90ResultModel(
        somatization: somatizationResult,
        oKB: oKBResult,
        interpersonalSensitivity: interpersonalSensitivityResult,
        depression: depressionResult,
        anxiety: anxietyResult,
        angerEnmity: angerEnmityResult,
        phobicAnxiety: phobicAnxietyResult,
        paranoidThought: paranoidThoughtResult,
        psychoticism: psychoticismResult,
        additionalScales: additionalScalesResult));
  }

  double transactions(List<int> indexs) {
    int index;
    double mentalIllnes = 0;
    for (index in indexs) {
      mentalIllnes += answer[index];
    }
    mentalIllnes /= somatizationIndex.length;
    mentalIllnes *= 25; //yuzdelik deger dondurur
    return mentalIllnes.toPrecision(2);
  }

  void nextPage() {
    int i;
    bool canChangePage = true;

    for (i = 0; i < 9; i++) {
      print(
          "i = $i testPageIndex = ${testPageIndex.value} cevap: ${answer[i + testPageIndex.value * 9]}");
      if (answer[i + testPageIndex.value * 9] == -1) {
        canChangePage = false;
      }
    }

    if (canChangePage && testPageIndex.value != 9) {
      testPageIndex.value++;
      questionIndex += 9;
    } else if (testPageIndex.value == 9 && canChangePage) {
      symptomIdentification();
    } else {
      //sayfalardaki sorular isaretlenmemeis
      flutterErrorToast(
          "Bir dahaki sayfaya gecmek icin tum sorulari cevaplandirmalisiniz");
    }
  }

  int getTestPageIndex() {
    return testPageIndex.value;
  }

  int getQuestionIndex() {
    return questionIndex.value;
  }

  void previousPage() {
    if (testPageIndex.value != 0) {
      testPageIndex.value--;
      questionIndex -= 9;
    }
  }

  void selecttooggle(int index, int val) {
    print('BEFORE list[index]:${list[index]}');
    list[index] = List.generate(5, (index) => false);
    print('AFTER list[index]:${list[index]}');
    list[index][val] = true;
    print('SET AFTER list[index]:${list[index]}');
    // print(index);
    // print(val);
  }

  void button(int index, int val) {
    answer[index] = val;
    print(answer.toList());
  }
}
