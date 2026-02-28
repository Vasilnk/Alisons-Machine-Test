import 'package:alisons_machine_test/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:alisons_machine_test/screens/splash/splash_screen.dart';
import 'package:alisons_machine_test/screens/login/login_screen.dart';
import 'package:alisons_machine_test/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alisons Machine Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: 'Lufga',
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
