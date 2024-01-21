import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '/core/localization/translate.helper.dart';
import '/splash/controllers/splash.controller.dart';
import '/core/snackbar/app.snackbar.dart';
import '/core/routes/app.routes.dart';
import '/core/firebase/firebase-store.service.dart';
import '/core/models/models.dart';

class FirebaseAuthService extends GetxService {
  @override
  void onInit() {
    super.onInit();
    _authStateListen();
  }

  /// Firebase authentication
  final FirebaseAuth _instance = FirebaseAuth.instance;

  //// Store service
  FirebaseStoreService storeService = Get.find<FirebaseStoreService>();

  /// Sign up
  Future<void> signUp(UserModel userModel) async {
    try {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      User user = credential.user!;
      await storeService.addUserInfo(user.uid, userModel.info!);
      AppSnackbar.success(TranslateHelper.registrationSuccessed);
    } on FirebaseAuthException catch (e) {
      String message = TranslateHelper.registrationFailed;
      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      AppSnackbar.error(TranslateHelper.registrationFailed, message);
    }
  }

  /// Sign in
  Future<void> signIn(String email, String password) async {
    try {
      await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppSnackbar.success(TranslateHelper.loginSuccessed);
    } on FirebaseAuthException catch (e) {
      String descripton = 'No user found for that email.';
      if (e.code == 'wrong-password') {
        descripton = 'Wrong password provided for that user.';
      }
      AppSnackbar.error(TranslateHelper.loginFailed, descripton);
    }
  }

  UserModel? get user {
    final result = _instance.currentUser;
    if (result == null) return null;
    UserModel user = UserModel(
      uid: result.uid,
      email: result.email,
    );
    return user;
  }

  void _authStateListen() {
    _instance.authStateChanges().listen((event) {
      if (Get.isRegistered<SplashController>()) return;
      if (event == null) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    });
  }

  Future<void> logout() async {
    await _instance.signOut();
    AppSnackbar.success(TranslateHelper.logoutSuccessed);
  }
}
