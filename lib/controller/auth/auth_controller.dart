import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../main_controller.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  static MainController mainController = Get.find();
  late Rx<User?> firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, isLoggedListener);
  }

  isLoggedListener(User? user) {
    mainController.isLogged.value = user == null ? false : true;
  }
}
