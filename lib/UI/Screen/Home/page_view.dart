import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final List<String> highlightedText;
  final String backgroundImage;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.highlightedText,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(    
          height: 600,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage(AssetPath.onBoardingImage), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 180,
          left: 40,
          right: 20,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                    color: Color.fromARGB(189, 127, 127, 124),
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Join Our Community!',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        Text(
                          'Share your moments to inspire and connect with others, spreading positivity and gratitude.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -34,
                right: 60,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AssetPath.onBoardingImage),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AssetPath.onBoardingImage),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 32,
          right: 20,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(width: 1, color: Colors.white),
              ),
              height: 36,
              width: 80,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainButtonNavbarScreen(),));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
 
}
