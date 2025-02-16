import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:glimmcatcher/UI/Widgets/onBoarding.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController otpCtrl = TextEditingController();
  bool _obscureText = true;
  bool _confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Reset Password',
          title: 'Reset your password',
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
                      resetPasswordSection(),
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

  Widget resetPasswordSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Set Password',
          style: TextStyle(
              color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
        ),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: '***********',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          'Confirm Password',
          style: TextStyle(
              color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
        ),
        SizedBox(
          height: 4,
        ),
       TextFormField(
          obscureText: _confirmObscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _confirmObscureText = !_confirmObscureText;
                });
              },
            ),
            hintText: '***********',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        GradientElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingView(),
                  ));
            },
            text: 'Confirm',
            isRowButton: false),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
