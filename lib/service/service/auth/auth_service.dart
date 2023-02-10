import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/managers/firebase/crashlytics_manager.dart';
import '../../model/common/login/login_model.dart';
import '../../model/common/signup/sign_up_model.dart';
import 'i_auth_service.dart';

class AuthService extends IAuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CrashlyticsManager _crashlyticsManager = CrashlyticsManager.instance;

  @override
  Future<UserCredential?> signInWithEmail(LoginModel loginModel) async {
    try {
      final UserCredential result =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      return result;
    } catch (e) {
      await _crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign in with email service');
      rethrow;
    }
  }

  @override
  Future<UserCredential> signUpWithEmail(SignUpModel signUpModel) async {
    try {
      final UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      return result;
    } catch (e) {
      await _crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign up with email service');
      rethrow;
    }
  }
}
