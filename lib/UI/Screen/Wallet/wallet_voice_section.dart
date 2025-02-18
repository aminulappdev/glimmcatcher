import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WalletVoiceScreen extends StatelessWidget {
  const WalletVoiceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(height / 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Louis Hamilton',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600,
                              fontSize: height / 44),
                        ),
                        SizedBox(
                          height: height / 200,
                        ),
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
                      ],
                    ),
                    Container(
                      height: height / 24,
                      width: width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(AssetPath.music),
                              fit: BoxFit.fill),
                          color: Colors.transparent),
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: AppColors.gradiantColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        size: height / 24,
                        Icons.play_circle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
