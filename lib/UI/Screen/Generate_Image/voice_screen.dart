import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      // print('Selected File: ${result.files.single.path}');
    } else {
      // print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Voice',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(height / 72),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 100),
                  Text(
                    'Enter Text',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600, fontSize: height / 46),
                  ),
                  SizedBox(height: height / 100),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please type';
                      }
                      return null;
                    },
                    maxLines: 2,
                    controller: TextEditingController(text: recordedText),
                    decoration: InputDecoration(
                      hintText: 'Type anything',
                      enabledBorder: GradientOutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gradient:
                            LinearGradient(colors: AppColors.gradiantColors),
                        width: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 48),
                  voiceSection(),
                  SizedBox(height: height / 48),
                  TextFormField(
                    maxLines: 1,
                    readOnly: true,
                    controller: TextEditingController(text: selectedFile ?? ""),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.upload_rounded,
                            color: Colors.purple),
                        onPressed: pickFile,
                      ),
                      hintText: 'Upload',
                      enabledBorder: GradientOutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gradient:
                            LinearGradient(colors: AppColors.gradiantColors),
                        width: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 48),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainButtonNavbarScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.urbanist(
                          fontSize: height / 46, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
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
                color: AppColors.themeColor,
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
