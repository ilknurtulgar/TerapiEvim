import 'package:firebase_auth/firebase_auth.dart';
import 'package:terapievim/components/toast/toast.dart';

import '../../../core/init/print_dev.dart';
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        flutterErrorToast('No user found for that email.');
        PrintDev.instance.exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        PrintDev.instance.exception('Wrong password provided for that user.');
        flutterErrorToast('Wrong password provided for that user.');
      }
    } catch (e) {
      await _crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign in with email service');
      rethrow;
    }
    return null;
  }

  @override
  Future<UserCredential?> signUpWithEmail(SignUpModel signUpModel) async {
    try {
      final UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      //TODO save data to firestore;

      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        flutterErrorToast('The password provided is too weak.');
        PrintDev.instance.exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        flutterErrorToast('The account already exists for that email.');
        PrintDev.instance.exception('The account already exists for that email.');
      }
    } catch (e) {
      await _crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign up with email service');
      rethrow;
    }
    return null;
  }
}
