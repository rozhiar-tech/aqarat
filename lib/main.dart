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
import 'package:lottie/lottie.dart';

void main() async {
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
      defaultTransition:
          Transition.fade, // Use a fade transition for better visual experience
      initialRoute: "/splash", // Use the splash route as the initial route
      getPages: [
        // Define the splash screen route
        GetPage(
          name: "/splash",
          page: () => SplashScreen(),
          middlewares: [SplashScreenController()], // Use the custom middleware
        ),
        // Define other routes here
        ...AppPages.routes,
      ],
    );
  }
}

class SplashScreenController extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Add any additional delay if you want to show the splash screen for a certain duration
    Future.delayed(Duration(seconds: 10), () {
      Get.offNamed(
          AppPages.INITIAL); // Navigate to the main app screen after the delay
    });
    return null;
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Here, you can customize the Lottie animation as per your preferences
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset('assets/LOGO.json')),
    );
  }
}
