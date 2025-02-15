import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/payment_field_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            colors: [
              Color.fromARGB(255, 217, 179, 234),
              Color.fromARGB(255, 241, 231, 245),
              Color.fromARGB(255, 255, 255, 255)
            ], // Define gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                ),
                SvgPicture.asset(
                  AssetPath.splashScreenLogo,
                  width: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    'Unlock the most powerful AI research assitant',
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFDB92FE),
                          Color(0xFFFBC774),
                        ], // Provide at least two colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.done,
                        color: Colors
                            .white, // Keep this as white for the gradient effect to work
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Unlock AI generate image',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFDB92FE),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFDB92FE),
                          Color(0xFFFBC774),
                        ], // Provide at least two colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.done,
                        color: Colors
                            .white, // Keep this as white for the gradient effect to work
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Pro support from our team',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFDB92FE),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFDB92FE),
                          Color(0xFFFBC774),
                        ], // Provide at least two colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.done,
                        color: Colors
                            .white, // Keep this as white for the gradient effect to work
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Early access to new features',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFDB92FE),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 180,
                          width: 175,
                          decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                                  Color(0xFFDB92FE),
                                  Color(0xFFFBC774),
                                ]),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                          fontSize: 24,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w400),
                                      colors: [
                                        Color(0xFFDB92FE),
                                        Color(0xFFFBC774),
                                      ],
                                    ),
                                    GradientText(
                                      '\$20.00',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 28,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w800),
                                      colors: [
                                        Color(0xFFDB92FE),
                                        Color(0xFFFBC774),
                                      ],
                                    ),
                                  ],
                                ),
                                GradientText(
                                  'Select your plan',
                                  style: GoogleFonts.urbanist(
                                      fontSize: 16, fontWeight: FontWeight.w400),
                                  colors: [
                                    Color(0xFFDB92FE),
                                    Color(0xFFFBC774),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          right: 0,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFDB92FE),
                                  Color(0xFFFBC774),
                                ],
                              ),
                            ),
                            child: Icon(Icons.done, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 180,
                          width: 175,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(160, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Monthly',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 24,
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Text(
                                      '\$200',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 28,
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Select your plan',
                                  style: GoogleFonts.urbanist(
                                      fontSize: 16,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
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
    );
  }
}
