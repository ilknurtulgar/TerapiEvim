import 'package:firebase_auth/firebase_auth.dart';

abstract class DataBase {
  //tüm kullanıcıları bana getir
  Future<List<User>> getAllUser();
}
