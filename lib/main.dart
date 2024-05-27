import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooliday/extensions/splash_screen.dart';




void main() {
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
        primaryColor: Color(0xFF3Ebace),
        hintColor: Color(0xffd8ecf1),
        scaffoldBackgroundColor: Color(0xfff3f5f7),
      ),
      home: OnboardScreen(),
    );
  }
}

// accents color is now changed to hintcolor. 
