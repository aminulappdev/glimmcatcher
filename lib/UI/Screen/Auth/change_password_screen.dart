import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:glimmcatcher/UI/Widgets/onBoarding.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController otpCtrl = TextEditingController();

   bool _obscureText = true;
  bool _confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Change password',
          title: 'Change your password',
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
                      changePasswordFormBuild(),
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

  Widget changePasswordFormBuild() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Old Password',
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
          SizedBox(
            height: 16,
          ),
           Text(
            'New Password',
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
          SizedBox(
            height: 16,
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
      ),
    );
  }
}
