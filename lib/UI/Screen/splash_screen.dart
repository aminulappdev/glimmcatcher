import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glimmcatcher/UI/Widgets/onBoarding.dart';
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
    // _movetoNewScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetPath.splashScreenLogo,
                width: width/1.4,
              ),
              SizedBox(
                height: height/20,
              ),
              Text(
                'Find your missing',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600,
                    fontSize: height/32,
                    color: Color(0xFF585574)),
              ),
              Text(
                'puzzle piece 💝😍',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w900,
                    fontSize: height/36,
                    color: Color(0xFFDB92FE)),
              ),
              SizedBox(
                width: width/1.1,
                child: Text(
                  'Find your missing one and share your passions, quirks, and everything in between. Your exciting adventure starts here! 😉',
                  style: GoogleFonts.urbanist(
                      fontSize: height/52, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height/36,
              ),
              SizedBox(
                width: width/2,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDB92FE),
                    foregroundColor: Colors.white,
                    fixedSize: const Size.fromWidth(double.maxFinite),
            
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Color.fromARGB(255, 146, 75, 179),
                    elevation: 5,
                  ),
                  child: GestureDetector(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingView()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: height/48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
