import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Auth/auth_screen.dart';
import 'package:glimmcatcher/UI/Screen/Home/page_view.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(
                  () {
                    _currentPage = index;
                  },
                );
              },
              children: [
                OnboardingPage(
                  image: AssetPath.googleLogo,
                  title: "Create Memories with Your Best Friend",
                  subtitle:
                      "Connect with fellow pet lovers and cherish every wag, purr, and cuddle.",
                  highlightedText: ["Memories", "Your"],
                  backgroundImage: AssetPath.backgroundImage,
                ),
                OnboardingPage(
                  image: AssetPath.googleLogo,
                  title: "Let’s Make Your Pet the Star!",
                  subtitle:
                      "Snap, share, and shine—turn every moment into a story worth sharing.",
                  highlightedText: ["Make"],
                  backgroundImage: AssetPath.backgroundImage,
                ),
              ],
            ),
            Positioned(
              bottom: height / 6,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    effect: WormEffect(
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      spacing: 16.0,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: height / 30,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GradientElevatedButton(
                  onPressed: () {
                    {
                      if (_currentPage < 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(),
                          ),
                        );
                      }
                    }
                  },
                  text: 'Next',
                  isRowButton: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
