import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/generate_ai_screen.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/generate_image_video_screen.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/text_screen.dart';
import 'package:glimmcatcher/UI/Screen/Generate_Image/voice_screen.dart';
import 'package:glimmcatcher/UI/Screen/Home/notification_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:glimmcatcher/UI/Widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> screens = [
    GenerateAiScreen(),
    VoiceScreen(),
    GenerateImageVideoScreen(),
    TextScreen(),
  ];

  final List<String> titles = [
    "Wallet make AI Generate",
    "Wallet as a voice",
    "Wallet as a image/video",
    "Wallet as a text"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerSection(context),
            SizedBox(height: 8),
            Text(
              'What Memories Will You',
              style: GoogleFonts.urbanist(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff585574)),
            ),
            GradientText(
              'Capture Today?',
              style: GoogleFonts.urbanist(
                  fontSize: 24,
                  color: Colors.pink,
                  fontWeight: FontWeight.w800),
              colors: [
                Color(0xFFDB92FE),
                Color(0xFFFBC774),
              ],
            ),
            SizedBox(height: 20),
            mainSection(),
          ],
        ),
      ),
    );
  }

  Widget mainSection() {
    return SizedBox(
      height: 540,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            // ignore: sort_child_properties_last
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  titles[index],
                  style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screens[index],
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.gradiantColors, 
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Generate',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetPath.aiGenerate), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 102, 49, 107),
            ),
          );
        },
      ),
    );
  }

  Row headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AssetPath.onBoardingImage),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Elly!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  'How do you feel today?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ));
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffDB92FE),
                      Color(0xffFBC774),
                    ]),
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.notification_important,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
