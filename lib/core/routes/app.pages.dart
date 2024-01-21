import 'package:get/get.dart';
import 'package:hero_game/core/middlewares/auth.middleware.dart';
import '/home/bindings/home.binding.dart';
import '/home/pages/home.page.dart';
import 'app.routes.dart';
import '/login/bindings/login.binding.dart';
import '/register/bindings/register.binding.dart';
import '/login/pages/login.page.dart';
import '/register/pages/pages.dart';
import '/splash/bindings/splash.binding.dart';
import '/splash/pages/splash.page.dart';

abstract class AppPages {
  /// Initial route
  static String get initialRoute => AppRoutes.splash;

  // Splash Page
  static get _splashPage => GetPage(
        name: AppRoutes.splash,
        binding: SplashBinding(),
        page: () => const SplashPage(),
      );

  /// Register Page
  static get _register => GetPage(
        name: AppRoutes.register,
        binding: RegisterBinding(),
        page: () => const RegisterPage(),
      );

  static get _login => GetPage(
        name: AppRoutes.login,
        binding: LoginBinding(),
        page: () => const LoginPage(),
      );

  static get _home => GetPage(
        name: AppRoutes.home,
        binding: HomeBinding(),
        page: () => const HomePage(),
        middlewares: [
          AuthMiddleware(),
        ],
      );

  /// Application pages
  static get pages => <GetPage>[
        _splashPage,
        _register,
        _login,
        _home,
      ];
}
