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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height / 1.45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetPath.onBoardingImage), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: height / 4.5,
          left: width / 10,
          right: width / 15,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height / 4,
                decoration: BoxDecoration(
                    color: Color.fromARGB(189, 127, 127, 124),
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(height / 72),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Join Our Community!',
                          style: TextStyle(
                              fontSize: height / 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        Text(
                          'Share your moments to inspire and connect with others, spreading positivity and gratitude.',
                          style: TextStyle(
                              fontSize: height / 46,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -(height / 24),
                right: width / 8,
                child: Container(
                  height: height / 15,
                  width: width / 7,
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
                top: height / 24,
                right: 0,
                child: Container(
                  height: height / 22,
                  width: width / 10,
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
          top: height / 20,
          right: width / 20,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(width: 1, color: Colors.white),
              ),
              height: height / 22,
              width: width / 5,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainButtonNavbarScreen(),
                        ));
                  },
                  child: Text(
                    'Skip',
                    style:
                        TextStyle(color: Colors.white, fontSize: height / 50),
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
