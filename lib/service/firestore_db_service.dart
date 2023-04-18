import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:terapievim/service/database_base.dart';

class FirestoreDBService implements DataBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;
  @override
  Future<List<User>> getAllUser() async {
    QuerySnapshot querySnapshot = await _firebaseDB.collection("users").get();
    for (DocumentSnapshot tekUser in querySnapshot.docs) {
      print("okunan user: " + tekUser.data.toString());
    }
    return getAllUser();
  }
}
