import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/voice_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198),
                      width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198),
                      width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 215, 49, 198),
                      width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceScreen()));
            }, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
