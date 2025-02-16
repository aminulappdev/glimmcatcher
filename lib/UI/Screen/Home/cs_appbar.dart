
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Widgets/onBoarding.dart';

// ignore: must_be_immutable
class CSappBar extends StatefulWidget implements PreferredSizeWidget {
  CSappBar({super.key, this.isProfileScreenOpen = false, this.name});
  final bool isProfileScreenOpen;
  String? name;

  @override
  State<CSappBar> createState() => _CSappBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CSappBarState extends State<CSappBar> {
 
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             CircleAvatar(
              radius: 18,
              //  child: Image(image: NetworkImage(imageBytes.toString()),fit: BoxFit.fill,),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                 '',
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            )),
            IconButton(
              onPressed: () async {           
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingView()),
                    (_) => false);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
