import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'core/config/app.config.dart';
import 'core/localization/app.translation.dart';
import 'core/routes/app.pages.dart';
import 'core/themes/themes/light.theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppPages.initialRoute,
      theme: LightTheme.theme,
      translations: AppTranslation(),
      locale: AppConfig.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppConfig.supportedLocales,
      defaultTransition: Transition.fadeIn,
    );
  }
}
