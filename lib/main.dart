import 'package:aqarat/app/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  // Initialize Firebase or other services if needed
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightTheme,
      themeMode: ThemeMode.light, // Set theme mode to always light
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'IQ'),
        Locale('ar', 'EG'),
      ],
      debugShowCheckedModeBanner: false,
      title: "Aqarat",
      defaultTransition: Transition.fade,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
