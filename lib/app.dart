
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/splash_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';

class Glimmcatcher extends StatelessWidget {
  const Glimmcatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        elevatedButtonTheme: elevatedBottunThemeData(),
         inputDecorationTheme: inputDecoration(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }

 
  InputDecorationTheme inputDecoration() {
    return InputDecorationTheme(
      hintStyle: const TextStyle(fontWeight: FontWeight.w300),
      fillColor: Colors.white,
      filled: true,
      border: inputBorder(),
      enabledBorder: inputBorder(),
      focusedBorder: inputBorder(),
      errorBorder: inputBorder(),
      
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(  
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 161, 155, 155),
        width: 1
      ),
      borderRadius: BorderRadius.circular(14),
    );
  }
  
  
  ElevatedButtonThemeData elevatedBottunThemeData() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
        ),
      );              
  }
}
