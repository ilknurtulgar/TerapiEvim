import '../../core/init/network/model/error_model_custom.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/login/login_model.dart';
import '../../model/common/login/login_response_model.dart';
import '../../model/common/signup/sign_up_model.dart';

abstract class IAuthService {
  IAuthService(this.manager);
  final IFirestoreManager<ErrorModelCustom> manager;

  Future<LoginResponseModel?> signInWithEmail(LoginModel loginModel);

  ///Password is passed outside model to make sure that password is not saved to db
  Future<String?> signUpWithEmail({
    required SignUpModel signUpModel,
    required String password,
  });

  Future<void> signOut();
}
