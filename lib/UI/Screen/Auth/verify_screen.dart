import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Auth/otp_verify_screen.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Verify',
          title: 'Verify with you email account',
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 80,
                ),
                Padding(
                  padding: EdgeInsets.all(height / 58),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verifyFormBuild(height, width),
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

  Widget verifyFormBuild(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.email, color: Colors.grey),
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: height / 48,
          ),
          GradientElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPVerifyScreen(),
                      ));
                }
              },
              text: 'Verify',
              isRowButton: false),
        ],
      ),
    );
  }
}
