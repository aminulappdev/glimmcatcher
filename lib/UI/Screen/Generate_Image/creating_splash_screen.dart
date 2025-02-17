import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/result_generate_ai_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatingSplashScreen extends StatefulWidget {
  const CreatingSplashScreen({super.key});

  @override
  State<CreatingSplashScreen> createState() => _CreatingSplashScreenState();
}

class _CreatingSplashScreenState extends State<CreatingSplashScreen>
    with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    
    // Initialize Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Rotation speed
      vsync: this,
    )..repeat(); // Repeat rotation infinitely

    _movetoNewScreen();
  }

  Future<void> _movetoNewScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultGenerateAiScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation when screen is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF585574),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Rotating Animation
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 6.2832, 
                    child: child,
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage(AssetPath.ellipse),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Creating',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
