import 'package:firebase_auth/firebase_auth.dart';

import '../../core/base/component/toast/toast.dart';
import '../../core/base/service/base_service.dart';
import '../../core/constants/api_const.dart';
import '../../core/constants/utils/text_constants/error_text_const.dart';
import '../../core/init/network/model/error_model_custom.dart';
import '../../core/init/print_dev.dart';
import '../../core/managers/firebase/firestore/i_firestore_manager.dart';
import '../../model/common/login/login_model.dart';
import '../../model/common/login/login_response_model.dart';
import '../../model/common/signup/sign_up_model.dart';
import '../../model/participant/_initial_data/p_initial_data.dart';
import '../../model/therapist/_initial_data/t_initial_data.dart';
import 'i_auth_service.dart';

class AuthService extends IAuthService with BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthService(IFirestoreManager<ErrorModelCustom> manager) : super(manager);

  @override
  Future<LoginResponseModel?> signInWithEmail(LoginModel loginModel) async {
    try {
      final UserCredential result =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      if (result.user == null) {
        throw Exception(
            "could not get result.user in auth_service/signInWithEmail");
      }

      final response =
          await manager.readOne<LoginResponseModel, LoginResponseModel>(
        collectionPath: APIConst.users,
        docId: result.user!.uid,
        parseModel: LoginResponseModel(),
      );
      if (response.data == null) return null;

      response.data?.userId = result.user!.uid;
      return response.data;
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
  Future<String?> signUpWithEmail({
    required SignUpModel signUpModel,
    required String password,
  }) async {
    try {
      final UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: password,
      );

      if (result.user == null) {
        throw Exception('result.user is null in auth_service/signUpWithEmail');
      }

      signUpModel.id = result.user!.uid;

      final bool isSuccess = await manager.createWithDocId(
          collectionPath: APIConst.users,
          docId: result.user!.uid,
          value: signUpModel.toJson()!);
      if (isSuccess == false) {
        throw Exception('Could not create user at auth_service');
      }

      return result.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        flutterErrorToast(ErrorConst.passwordIsTooWeak);
        PrintDev.instance.exception(ErrorConst.passwordIsTooWeak);
      } else if (e.code == 'email-already-in-use') {
        flutterErrorToast(ErrorConst.accountAlreadyExists);
        PrintDev.instance.exception(ErrorConst.accountAlreadyExists);
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

  @override
  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
      return;
    } catch (e) {
      await crashlyticsManager.sendACrash(
          error: e.toString(), stackTrace: StackTrace.current, reason: '');
      return;
    }
  }

  @override
  Future<PInitialData?> fetchInitialDataOfParticipant() async {
    try {
      if (userId == null) return null;

      final result = await manager.readOne<PInitialData, PInitialData>(
        collectionPath: APIConst.participant,
        docId: userId!,
        parseModel: PInitialData(),
      );
      if (result.error != null) {
        return null;
      }

      return result.data;
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'fetchInitialDataOfParticipant',
      );
      return null;
    }
  }

  @override
  Future<TInitialData?> fetchInitialDataOfTherapist() async {
    try {
      if (userId == null) return null;

      final result = await manager.readOne<TInitialData, TInitialData>(
        collectionPath: APIConst.therapist,
        docId: userId!,
        parseModel: TInitialData(),
      );
      if (result.error != null) {
        return null;
      }

      return result.data;
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'fetchInitialDataOfTherapist',
      );
      return null;
    }
  }
}
