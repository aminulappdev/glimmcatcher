import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notification',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 24),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 5,
                  ),
                  Expanded(
                      child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.themeColor,
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Welcome to Glimmers',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: height / 46),
                    ),
                    subtitle: Text('1 day ago'),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
