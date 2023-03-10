import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/base/component/toast/toast.dart';
import '../../../core/base/service/base_service.dart';
import '../../../core/constants/api_const.dart';
import '../../../core/init/print_dev.dart';
import '../../model/common/login/login_model.dart';
import '../../model/common/signup/sign_up_model.dart';
import 'i_auth_service.dart';

class AuthService extends IAuthService with BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign in with email service');
      rethrow;
    }
    return null;
  }

  @override
  Future<UserCredential?> signUpWithEmail({
    required SignUpModel signUpModel,
    required String password,
  }) async {
    try {
      final UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: password,
      );

      firestoreManager.create(
          collectionPath: APIConst.users, value: signUpModel.toJson()!);

      return result;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        flutterErrorToast('The password provided is too weak.');
        PrintDev.instance.exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        flutterErrorToast('The account already exists for that email.');
        PrintDev.instance
            .exception('The account already exists for that email.');
      }
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(),
          stackTrace: StackTrace.current,
          reason: 'error at sign up with email service');
      rethrow;
    }
    return null;
  }
}
