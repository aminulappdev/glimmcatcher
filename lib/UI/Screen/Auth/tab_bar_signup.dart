import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:glimmcatcher/UI/Widgets/onBoarding.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpTabBar extends StatefulWidget {
  const SignUpTabBar({super.key});

  @override
  State<SignUpTabBar> createState() => _SignUpTabBarState();
}

class _SignUpTabBarState extends State<SignUpTabBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _confirmObscureText = true;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height / 58),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          signUpFormBuild(height, width),
          SizedBox(
            height: height / 68,
          ),
        ],
      ),
    );
  }

  Widget signUpFormBuild(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
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
                return 'Enter full name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'full name',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: height / 100,
          ),
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
            height: height / 100,
          ),
          Text(
            'Gender',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          DropdownButtonFormField<String>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter gender';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Gander',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: selectedGender,
            items: ["Male", "Female"].map((String gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(
                  gender,
                  style: TextStyle(color: Colors.grey, fontSize: height / 50),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
          ),
          SizedBox(
            height: height / 100,
          ),
          Text(
            'Phone Number',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          IntlPhoneField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              hintText: '(+880) 1731-25',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            initialCountryCode: 'BD', // Default country code
            onChanged: (phone) {},
          ),
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
            autofocus: true,
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
            autofocus: true,
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
          SizedBox(height: 16),
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
              text: 'Register',
              isRowButton: false),
          SizedBox(
            height: height / 1.5,
          ),
        ],
      ),
    );
  }
}
