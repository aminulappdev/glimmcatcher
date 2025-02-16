import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/creating_splash_screen.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/voice_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text',
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Type anything',
                enabledBorder: GradientOutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: AppColors.gradiantColors),
                    width: 1),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatingSplashScreen()));
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
