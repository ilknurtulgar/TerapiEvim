import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/firestore_db_service.dart';

import '../../base/base_controller.dart';

class TMessageController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  void onInit() {
    firestoreDBService = FirestoreDBService();
    super.onInit();
  }

  var personValue = false.obs;
  void onPersonListChange() {
    personValue.value = !personValue.value;
  }

  Future<List<User>> getAllUsers() async {
    var allUserList = await getAllUser();
    return allUserList;
  }

  Future<List<User>> getAllUser() async {
    var allUserList = await firestoreDBService.getAllUser();
    return allUserList;
  }

  late FirestoreDBService firestoreDBService;
}
