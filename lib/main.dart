import 'package:fit_start_app/screens/onboarding_height.dart';
import 'package:fit_start_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitStart',
     theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingHeight(),
    );
  }
}

