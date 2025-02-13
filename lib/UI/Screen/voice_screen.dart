import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

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
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(AssetPath.frame1000003796),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Type anything',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),        
            ElevatedButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => CreatingSplashScreen()));
            }, child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Save',style: GoogleFonts.urbanist(fontSize: 18,fontWeight: FontWeight.w700),),
            ))
          ],
        ),
      ),
    );
  }
}
