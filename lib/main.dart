import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lottie/lottie.dart';

import 'app/modules/dashboard/views/dashboard_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase or other services if needed
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
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // Add your supported locales here
      ],
      debugShowCheckedModeBanner: false,
      title: "Aqarat",
      defaultTransition: Transition.fade,
      initialRoute: '/splash', // Use the splash route as the initial route
      getPages: [
        GetPage(name: '/splash', page: () => VideoSplashScreen()),
        GetPage(name: '/dashboard', page: () => DashboardView()),
        // Add other routes here
      ],
    );
  }
}

class VideoSplashScreen extends StatefulWidget {
  @override
  _VideoSplashScreenState createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;
  bool _controllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    try {
      _controller = VideoPlayerController.asset('assets/LOGO.mp4')
        ..addListener(_videoListener);

      await _controller.initialize();
      setState(() {
        _controllerInitialized = true;
        _controller.play();

        // Start a timer to navigate after a certain duration
        Timer(Duration(seconds: 5), () {
          _navigateToDashboard();
        });
      });
    } catch (error) {
      print("Error initializing video player: $error");
    }
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration) {
      _navigateToDashboard();
    }
  }

  void _navigateToDashboard() {
    // Navigate to the dashboard screen
    Get.offAllNamed('/dashboard'); // Adjust the route name as needed
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controllerInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
