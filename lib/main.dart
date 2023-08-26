import 'dart:async';

import 'package:aqarat/app/theme/dark_theme.dart';
import 'package:aqarat/app/theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:aqarat/app/theme/dark_theme.dart';
import 'package:aqarat/app/theme/light_theme.dart';
import 'app/modules/dashboard/views/dashboard_view.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      darkTheme: darkTheme,
      supportedLocales: const [
        const Locale('en', ''), // Add your supported locales here
      ],
      debugShowCheckedModeBanner: false,
      title: "Aqarat",
      defaultTransition: Transition.fade,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
