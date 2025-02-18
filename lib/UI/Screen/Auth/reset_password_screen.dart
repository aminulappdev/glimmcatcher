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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Reset Password',
          title: 'Reset your password',
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
                      resetPasswordFormBuild(height, width),
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

  Widget resetPasswordFormBuild(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set Password',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter password';
              }
              return null;
            },
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
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter password';
              }
              return null;
            },
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
            height: height / 48,
          ),
          GradientElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingView(),
                      ));
                }
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
