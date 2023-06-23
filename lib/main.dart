import 'package:aqarat/app/theme/dark_theme.dart';
import 'package:aqarat/app/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'L10n/l10n.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      title: "Aqarat",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
