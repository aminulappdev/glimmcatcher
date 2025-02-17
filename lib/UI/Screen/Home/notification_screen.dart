import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,radius: 5,
              ),
              Expanded(child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.themeColor,
                  child: Icon(Icons.notifications,color: Colors.white,),
                ),
                title: Text('Welcome to Glimmers',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                subtitle: Text('1 day ago'),
              ))
            ],
          ),
        );
      },),
    );
  }
}