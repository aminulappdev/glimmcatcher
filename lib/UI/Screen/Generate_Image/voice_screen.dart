import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import 'creating_splash_screen.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voice',
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'Enter Text',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Type anything',
                  enabledBorder: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      gradient:
                          LinearGradient(colors: AppColors.gradiantColors),
                      width: 1),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AssetPath.frame1000003796),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  suffixIcon: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Color(0xFFDB92FE),
                          Color(0xFFFBC774),
                        ], // Provide at least two colors
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.upload_rounded,
                        color: Colors
                            .white, // Keep this as white for the gradient effect to work
                      ),
                    ),
                  hintText: 'Upload',
                  enabledBorder: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      gradient:
                          LinearGradient(colors: AppColors.gradiantColors),
                      width: 1),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatingSplashScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      'Save',
                      style: GoogleFonts.urbanist(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
