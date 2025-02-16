import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultGenerateAiScreen extends StatefulWidget {
  const ResultGenerateAiScreen({super.key});

  @override
  State<ResultGenerateAiScreen> createState() => _ResultGenerateAiScreenState();
}

class _ResultGenerateAiScreenState extends State<ResultGenerateAiScreen> {
  bool togggleActive = false;
  bool isToggled = false;

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
                  toggleButton()
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainButtonNavbarScreen()));
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainButtonNavbarScreen(),));

                  },
                  child: Text('Share')),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector toggleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled; // Toggle the state
        });
      },
      child: Container(
        width: 70,
        height: 36,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFDB92FE), Color(0xFFFBC774)], // Gradient colors
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          children: [
            // Animated Circle Avatar for Smooth Transition
            AnimatedPositioned(
              duration: Duration(milliseconds: 300), // Smooth animation time
              curve: Curves.easeInOut, // Smooth animation effect
              left: isToggled ? 36 : 2, // Move right when toggled
              top: 2, // Keep it centered vertically
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 58, 55, 46),
                radius: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
