import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class GenerateAiScreen extends StatefulWidget {
  const GenerateAiScreen({super.key});

  @override
  State<GenerateAiScreen> createState() => _GenerateAiScreenState();
}

class _GenerateAiScreenState extends State<GenerateAiScreen> {
  bool isToggled = false;

  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'AI Generate',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetPath.women), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Show prompt in artwork',
                    style: GoogleFonts.urbanist(
                        color: Color(0xFF585574),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  IconButton(
                    onPressed: toggleButton,
                    icon: Icon(
                        isToggled ? Icons.visibility : Icons.visibility_off),
                    color: isToggled ? Colors.green : Colors.red,
                    iconSize: 40,
                  ),
                ],
              ),
              Text(
                'Hyperrealistic portrait of a beautiful woman wearing intricately detailed colorful clothing and futuristic jewellery.',
                style: GoogleFonts.urbanist(
                    color: Color(0xFF585574),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceScreen()));
                  },
                  child: Text('Save')),
              SizedBox(
                height: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  // Your action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Transparent background
                  foregroundColor: Colors.black, // Text color
                  shadowColor: Colors.transparent, // Remove shadow
                  side:
                      BorderSide(color: Colors.black, width: 1), // Black border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: Text('Share'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
