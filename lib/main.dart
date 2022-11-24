import 'package:flutter/material.dart';
import 'package:mengenal_satwa/view/splash_screen.dart';
import 'package:mengenal_satwa/view/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bali Zoo',
      theme: ThemeData(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/Onboard': (context) => const SplashScreen(),
        '/Home': (context) => const MainScreen(),
      },
    );
  }
}
