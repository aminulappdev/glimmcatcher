import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/auth_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetPath.onBoardingImage),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: -50,
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
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            threeDotSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GradientElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ),
                  );
                },
                text: 'Next',
                isRowButton: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row threeDotSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFDB92FE),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 182, 179, 179),
            maxRadius: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 182, 179, 179),
            maxRadius: 5,
          ),
        ),
      ],
    );
  }
}
