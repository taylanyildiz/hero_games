import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/dialogs/app.dialog.dart';
import '/core/models/models.dart';
import '/core/firebase/firebase-auth.service.dart';
import '/register/enums/register-page.enum.dart';

class RegisterController extends GetxController with _Inputs, _Page {
  /// Firebase auth service
  final authService = Get.find<FirebaseAuthService>();

  /// Next button click
  void onNextPage() async {
    switch (pageEnum) {
      case ERegisterPage.emailPage:
        if (emailValidate) onChangePage(ERegisterPage.infoPage);
        break;
      case ERegisterPage.infoPage:
        if (infoValidate) onChangePage(ERegisterPage.passwordPage);
        break;
      case ERegisterPage.passwordPage:
        if (passwordValidate) await register();
        break;
    }
  }

  Future<void> register() async {
    // Created user model
    final user = UserModel(
      email: email,
      password: password,
      info: UserInfoModel(
        biography: bio,
        name: name,
        birthDate: birtDate,
      ),
    );
    AppDialog.loading(close: false, onBuild: () => authService.signUp(user));
  }

  void onChangedBirthDate(DateTime date) {
    birtDate = date;
  }
}

mixin _Inputs {
  /// Email page validator
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  bool get emailValidate => emailKey.currentState?.validate() ?? false;

  /// Info page validator
  GlobalKey<FormState> infoKey = GlobalKey<FormState>();
  bool get infoValidate => infoKey.currentState?.validate() ?? false;

  /// Info page validator
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  bool get passwordValidate => passwordKey.currentState?.validate() ?? false;

  TextEditingController emailController = TextEditingController();
  String get email => emailController.text;

  TextEditingController nameController = TextEditingController();
  String get name => nameController.text;

  TextEditingController bioController = TextEditingController();
  String get bio => bioController.text;

  TextEditingController passwordController = TextEditingController();
  String get password => passwordController.text;

  TextEditingController confPasswordController = TextEditingController();
  String get confPassword => confPasswordController.text;

  DateTime birtDate = DateTime.now();
}

mixin _Page on _Inputs {
  /// Page enum type
  ERegisterPage pageEnum = ERegisterPage.emailPage;

  /// Page controller
  final PageController pageController = PageController();

  Future<void> onChangePage(ERegisterPage ePage) async {
    await pageController.animateToPage(
      ePage.page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void onBack() {
    if (pageEnum == ERegisterPage.emailPage) return Get.back();
    pageController.animateToPage(
      pageEnum.page - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int index) {
    pageEnum = ERegisterPage.values.firstWhere((e) => e.page == index);
  }
}
