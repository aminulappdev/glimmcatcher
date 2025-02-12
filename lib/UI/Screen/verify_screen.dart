import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/otp_verify_screen.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Verify',
          title: 'Verify with you email account',
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),        
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      loginSection(),
                                         
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 
  Widget loginSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
        ),
         SizedBox(
          height: 4,
        ),
        TextFormField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.email,color: Colors.grey),
              hintText: 'example@gmail.com',
              hintStyle: TextStyle(color: Colors.grey)),
        ),
           
        SizedBox(
          height: 16,
        ),
        GradientElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVerifyScreen(),));
            }, text: 'Verify', isRowButton: false),
      ],
    );
  }


}
