import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glimmcatcher/UI/Screen/on_boarding_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _movetoNewScreen();
    super.initState();
  }

  Future<void> _movetoNewScreen() async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetPath.splashScreenLogo,
              width: 300,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Find your missing',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF585574)),
            ),
            Text(
              'puzzle piece 💝😍',
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Color(0xFFDB92FE)),
            ),
            SizedBox(
              width: 380,
              child: Text(
                'Find your missing one and share your passions, quirks, and everything in between. Your exciting adventure starts here! 😉',
                style: GoogleFonts.urbanist(
                    fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDB92FE),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Color.fromARGB(255, 146, 75, 179),
                elevation: 5,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
