import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import 'creating_splash_screen.dart';

class GenerateImageVideoScreen extends StatefulWidget {
  const GenerateImageVideoScreen({super.key});

  @override
  State<GenerateImageVideoScreen> createState() =>
      _GenerateImageVideoScreenState();
}

class _GenerateImageVideoScreenState extends State<GenerateImageVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image/Video',
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
                maxLines: 1,
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
              Text(
                'Descriptions',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: 4,
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
              Text(
                'Upload photo',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 04,
              ),
              uploadPhoto(context),
              SizedBox(
                height: 16,
              ),
              captureButton(context),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatingSplashScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Save',
                    style: GoogleFonts.urbanist(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget uploadPhoto(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      padding: EdgeInsets.all(6),
      color: Colors.black,
      strokeWidth: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetPath.downloadLight),
                          fit: BoxFit.fill)),
                ),
                Text(
                  'Drop your imager here, or browse jpg, png are allowed',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget captureButton(BuildContext context) {
    return Center(
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(50),
        padding: EdgeInsets.all(6),
        color: AppColors.themeColor,
        strokeWidth: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Capture',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 4,
                  ),
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
                      Icons.camera_alt_outlined,
                      color: Colors
                          .white, // Keep this as white for the gradient effect to work
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
