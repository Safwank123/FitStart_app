import 'package:fit_start_app/screens/splash_screen.dart';
import 'package:fit_start_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fit_start_app/services/preferences_service.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await PreferencesService.initialize(); 
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme.lightTheme, 
    );
  }
}