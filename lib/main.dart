import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/onboarding/onboard_screen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hooliday',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primaryColor: const Color(0xFF3Ebace),
        hintColor: const Color(0xffd8ecf1),
        scaffoldBackgroundColor: const Color(0xfff3f5f7),
      ),
      home: const OnboardScreen(),
    );
  }
}

// accents color is now changed to hintcolor. 
