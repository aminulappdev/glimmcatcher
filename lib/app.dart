
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/splash_screen.dart';

class Glimmcatcher extends StatelessWidget {
  const Glimmcatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         inputDecorationTheme: inputDecoration(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        color: const Color.fromARGB(255, 188, 188, 188),
        width: 1
      ),
      borderRadius: BorderRadius.circular(14),
    );
  }
  
  
}
