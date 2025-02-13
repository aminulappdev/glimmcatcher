import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/generate_ai_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';

class CreatingSplashScreen extends StatefulWidget {
  const CreatingSplashScreen({super.key});

  @override
  State<CreatingSplashScreen> createState() => _CreatingSplashScreenState();
}

class _CreatingSplashScreenState extends State<CreatingSplashScreen> {

  @override
  void initState() {
    _movetoNewScreen();
    super.initState();
  }

  Future<void> _movetoNewScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GenerateAiScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF585574),
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(image: AssetImage(AssetPath.ellipse))
            ),
          ),
        ),
      ),
    );
  }
}