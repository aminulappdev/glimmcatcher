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
  bool _obscureText = true;
  bool _confirmObscureText = true;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          signUpFormBuild(),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget signUpFormBuild() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'full name', hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: 8,
          ),
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
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Gender',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          DropdownButtonFormField<String>(
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
                  style: TextStyle(color: Colors.grey, fontSize: 16),
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
            height: 8,
          ),
          Text(
            'Phone Number',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
          ),
          IntlPhoneField(
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
            height: 16
          ),
          GradientElevatedButton(
             onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingView(),
                    ));
              },
               text: 'Register', isRowButton: false),
          SizedBox(
            height: 500,
          ),
        ],
      ),
    );
  }
}
