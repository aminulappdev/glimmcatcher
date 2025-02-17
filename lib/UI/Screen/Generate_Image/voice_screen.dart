// import 'package:flutter/material.dart';
// import 'package:glimmcatcher/UI/Utils/app_colors.dart';
// import 'package:glimmcatcher/UI/Utils/asset_path.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// import 'creating_splash_screen.dart';

// class VoiceScreen extends StatefulWidget {
//   const VoiceScreen({super.key});

//   @override
//   State<VoiceScreen> createState() => _VoiceScreenState();
// }

// class _VoiceScreenState extends State<VoiceScreen> {
//   stt.SpeechToText speechToText = stt.SpeechToText();
//   bool isListening = false;
//   String recordedText = "";

//   void startListening() async {
//     bool available = await speechToText.initialize();
//     if (available) {
//       setState(() => isListening = true);
//       speechToText.listen(
//         onResult: (result) {
//           setState(() => recordedText = result.recognizedWords);
//         },
//       );
//     }
//   }

//   void stopListening() {
//     setState(() => isListening = false);
//     speechToText.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Voice',
//           style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               Text(
//                 'Enter Text',
//                 style: GoogleFonts.urbanist(
//                     fontWeight: FontWeight.w600, fontSize: 18),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 maxLines: 2,
//                 controller: TextEditingController(text: recordedText),
//                 decoration: InputDecoration(
//                   hintText: 'Type anything',
//                   enabledBorder: GradientOutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     gradient: const LinearGradient(
//                         colors: [Color(0xFFDB92FE), Color(0xFFFBC774)]),
//                     width: 1,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               voiceSection(),
//               const SizedBox(height: 16),
//               TextFormField(
//                 maxLines: 1,
//                 decoration: InputDecoration(
//                   suffixIcon: ShaderMask(
//                     shaderCallback: (bounds) => const LinearGradient(
//                       colors: [Color(0xFFDB92FE), Color(0xFFFBC774)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ).createShader(bounds),
//                     child: const Icon(
//                       Icons.upload_rounded,
//                       color: Colors.white,
//                     ),
//                   ),
//                   hintText: 'Upload',
//                   enabledBorder: GradientOutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     gradient: const LinearGradient(
//                         colors: [Color(0xFFDB92FE), Color(0xFFFBC774)]),
//                     width: 1,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CreatingSplashScreen(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(
//                   'Save',
//                   style: GoogleFonts.urbanist(
//                       fontSize: 18, fontWeight: FontWeight.w700),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget voiceSection() {
//     return Center(
//       child: GestureDetector(
//         onTap: isListening ? stopListening : startListening,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               height: isListening ? 130 : 110,
//               width: isListening ? 130 : 110,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.themeColor.withOpacity(0.2),
//               ),
//             ),
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 image: DecorationImage(
//                     image: AssetImage(AssetPath.frame1000003796),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'creating_splash_screen.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  stt.SpeechToText speechToText = stt.SpeechToText();
  bool isListening = false;
  String recordedText = "";
  String? selectedFile;

  void startListening() async {
    bool available = await speechToText.initialize();
    if (available) {
      setState(() => isListening = true);
      speechToText.listen(
        onResult: (result) {
          setState(() => recordedText = result.recognizedWords);
        },
      );
    }
  }

  void stopListening() {
    setState(() => isListening = false);
    speechToText.stop();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt'], // Allow PDF and TXT files
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name;
      });
      print('Selected File: ${result.files.single.path}');
    } else {
      print('No file selected');
    }
  }

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
              const SizedBox(height: 8),
              Text(
                'Enter Text',
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 2,
                controller: TextEditingController(text: recordedText),
                decoration: InputDecoration(
                  hintText: 'Type anything',
                  enabledBorder: GradientOutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFDB92FE), Color(0xFFFBC774)]),
                    width: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              voiceSection(),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 1,
                readOnly: true,
                controller: TextEditingController(text: selectedFile ?? ""),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.upload_rounded, color: Colors.purple),
                   
                    onPressed: pickFile,
                  ),
                  hintText: 'Upload PDF or TXT',
                  enabledBorder: GradientOutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Color(0xFFDB92FE), Color(0xFFFBC774)]),
                    width: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreatingSplashScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.urbanist(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget voiceSection() {
    return Center(
      child: GestureDetector(
        onTap: isListening ? stopListening : startListening,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isListening ? 130 : 110,
              width: isListening ? 130 : 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.themeColor.withOpacity(0.2),
              ),
            ),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage(AssetPath.frame1000003796),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
