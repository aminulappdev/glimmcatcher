import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WalletTextScreen extends StatelessWidget {
  const WalletTextScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(height / 100),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: AppColors.gradiantColors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                            ),
                            GradientText(
                              '18 January 2025',
                              colors: AppColors.gradiantColors,
                              style: GoogleFonts.urbanist(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / 72,
                        ),
                        Text(
                          'Divine Beginnings for us…',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              fontSize: height / 50),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        Text(
                          'Please pray about a situation where people on a certain place continuously harass people and make them believe God is t with them. Please pray for the Holy Spirit to convict them and for God to read more.',
                          style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: height / 200,
                        ),
                        Text(
                          'More..',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffFBE774)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
