import 'package:get/get.dart';

class PTestQuestionsController extends GetxController {
  var testPageIndex = 0.obs;
  var questionIndex = 0.obs;
  void nextPage() {
    if (testPageIndex.value != 10) {
      testPageIndex.value++;
      questionIndex += 3;
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
      questionIndex -= 3;
    }
  }
}
