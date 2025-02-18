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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'Change password',
          title: 'Change your password',
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
                      changePasswordFormBuild(height, width),
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

  Widget changePasswordFormBuild(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Old Password',
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
          SizedBox(
            height: height / 48,
          ),
          Text(
            'New Password',
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
          SizedBox(
            height: height / 48,
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
        ],
      ),
    );
  }
}
