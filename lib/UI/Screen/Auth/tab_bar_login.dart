import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Auth/verify_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';

class TabBarWithLogin extends StatefulWidget {
  const TabBarWithLogin({
    super.key,
    required this.checkBox,
    required this.width,
  });

  final bool checkBox;
  final double width;

  @override
  State<TabBarWithLogin> createState() => _TabBarWithLoginState();
}

class _TabBarWithLoginState extends State<TabBarWithLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscureText = true; // Track password visibility
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height / 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginFormBuild(context, height, width),
          SizedBox(
            height: height / 68,
          ),
          liner(height, width),
          SizedBox(
            height: height / 68,
          ),
          footerSection(height, width),
        ],
      ),
    );
  }

  Widget liner(double height, double width) {
    return Padding(
      padding: EdgeInsets.all(height / 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width / 2.5,
            height: 1.5,
            color: Color.fromARGB(255, 193, 191, 191),
          ),
          Text(
            'Or',
            style: TextStyle(fontSize: height / 46, color: Colors.grey),
          ),
          Container(
            width: width / 2.5,
            height: 1.5,
            color: const Color.fromARGB(255, 193, 191, 191),
          ),
        ],
      ),
    );
  }

  Widget loginFormBuild(BuildContext context, double height, double width) {
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
              if (EmailValidator.validate(value) == false) {
                return 'Enter a valid email address';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: height / 200,
          ),
          Text(
            'Password',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print("Forgot Password Clicked!");
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w700),
                ),
              ),
            ],
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
                        builder: (context) => VerifyScreen(),
                      ));
                }
              },
              text: 'Log in',
              isRowButton: false),
        ],
      ),
    );
  }

  Widget footerSection(double height, double width) {
    return Column(
      children: [
        Container(
          height: height / 17,
          width: widget.width,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: height / 72,
                child: Image.asset(
                  AssetPath.googleLogoUp,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: width / 80,
              ),
              Text(
                'Continue with google',
                style: TextStyle(
                    fontSize: height / 50, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 48,
        ),
        Container(
          height: height / 17,
          width: widget.width,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: height / 72,
                child: Image.asset(
                  AssetPath.fbLogo,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: width / 80,
              ),
              Text(
                'Continue with facebook',
                style: TextStyle(
                    fontSize: height / 50, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}
