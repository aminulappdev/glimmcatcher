import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/payment_field_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isMonthly = true;
  bool isYearly = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 217, 179, 234),
          title: Text(
            'Subscriptions',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.subscriotionGradiantrColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(height / 72),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 24,
                  ),
                  SvgPicture.asset(
                    AssetPath.splashScreenLogo,
                    width: 80,
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  SizedBox(
                    width: width / 1.8,
                    child: Text(
                      'Unlock the most powerful AI research assitant',
                      style: GoogleFonts.urbanist(
                        fontSize: height / 46,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  costomRow('Unlock AI generate image', height, width),
                  SizedBox(
                    height: height / 160,
                  ),
                  costomRow('Pro support from our team', height, width),
                  SizedBox(
                    height: height / 160,
                  ),
                  costomRow('Early access to new features', height, width),
                  SizedBox(
                    height: height / 30,
                  ),
                  packageSection(height, width),
                  SizedBox(
                    height: height / 20,
                  ),
                  GradientElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentFieldScreen(),
                          ),
                        );
                      },
                      text: 'Subscribe',
                      isRowButton: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget packageSection(double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            isMonthly = true;
            isYearly = false;
            setState(() {});
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height / 4.5,
                width: width / 2.2,
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: isMonthly
                            ? AppColors.gradiantColors
                            : [Colors.black, Colors.black],
                      ),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(height / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            'Monthly',
                            style: GoogleFonts.urbanist(
                                fontSize: height / 36,
                                fontWeight: FontWeight.w400),
                            colors: isMonthly
                                ? AppColors.gradiantColors
                                : [Colors.black, Colors.black],
                          ),
                          GradientText(
                            '\$20.00',
                            style: GoogleFonts.urbanist(
                                fontSize: height / 30,
                                fontWeight: FontWeight.w800),
                            colors: isMonthly
                                ? AppColors.gradiantColors
                                : [Colors.black, Colors.black],
                          ),
                        ],
                      ),
                      GradientText(
                        'Select your plan',
                        style: GoogleFonts.urbanist(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                        colors: isMonthly
                            ? AppColors.gradiantColors
                            : [Colors.black, Colors.black],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isMonthly,
                child: Positioned(
                  top: -10,
                  right: 0,
                  child: Container(
                    height: height / 30,
                    width: height / 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AppColors.gradiantColors,
                      ),
                    ),
                    child: Icon(Icons.done, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            isMonthly = false;
            isYearly = true;
            setState(() {});
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height / 4.5,
                width: width / 2.2,
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: isYearly
                            ? AppColors.gradiantColors
                            : [Colors.black, Colors.black],
                      ),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(height / 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            'Yearly',
                            style: GoogleFonts.urbanist(
                                fontSize: height / 36,
                                fontWeight: FontWeight.w400),
                            colors: isYearly
                                ? AppColors.gradiantColors
                                : [Colors.black, Colors.black],
                          ),
                          GradientText(
                            '\$200.00',
                            style: GoogleFonts.urbanist(
                                fontSize: height / 30,
                                fontWeight: FontWeight.w800),
                            colors: isYearly
                                ? AppColors.gradiantColors
                                : [Colors.black, Colors.black],
                          ),
                        ],
                      ),
                      GradientText(
                        'Select your plan',
                        style: GoogleFonts.urbanist(
                            fontSize: height / 50, fontWeight: FontWeight.w400),
                        colors: isYearly
                            ? AppColors.gradiantColors
                            : [Colors.black, Colors.black],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isYearly,
                child: Positioned(
                  top: -10,
                  right: 0,
                  child: Container(
                    height: height / 30,
                    width: height / 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: AppColors.gradiantColors,
                      ),
                    ),
                    child: Icon(Icons.done, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget costomRow(String name, double height, double width) {
    return Row(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: AppColors.gradiantColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Icon(
            Icons.done,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: height / 50,
            color: Color(0xFFDB92FE),
          ),
        ),
      ],
    );
  }
}
