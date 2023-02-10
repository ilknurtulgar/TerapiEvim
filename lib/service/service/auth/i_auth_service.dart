import 'package:firebase_auth/firebase_auth.dart';

import '../../model/common/login/login_model.dart';
import '../../model/common/signup/sign_up_model.dart';

abstract class IAuthService {

  Future<UserCredential?> signInWithEmail(LoginModel loginModel);

  Future<UserCredential?> signUpWithEmail(SignUpModel signUpModel);
}
