import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/text_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(AssetPath.onBoardingImage),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Elly !',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'How do you feel today ?',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  
                ],
              ),
              CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AssetPath.googleLogo),
                  ),
            ],
          ),
          // ListTile(
          //   leading: CircleAvatar(
          //     radius: 40,
          //     backgroundImage: AssetImage(AssetPath.onBoardingImage),
          //   ),
          //   trailing: CircleAvatar(
      
          //     radius: 20,
          //     backgroundImage: AssetImage(AssetPath.onBoardingImage),
          //   ),
          //   title:
          //   subtitle: Text('How do you feel today ?'),
          // ),
          SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What Memories Will You',
                style: GoogleFonts.urbanist(
                    fontSize: 22, fontWeight: FontWeight.w800),
              ),
              Text(
                'Capture Today?',
                style: GoogleFonts.urbanist(
                    color: Colors.pink,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen(),));
                },
                child: Container(
                  height: 540,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 102, 49, 107),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
