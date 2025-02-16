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
  bool _obscureText = true; // Track password visibility
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(
                    color: const Color.fromARGB(255, 137, 136, 136),
                    fontSize: 16),
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
                'Password',
                style: TextStyle(
                    color: const Color.fromARGB(255, 137, 136, 136),
                    fontSize: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!; // Toggle checkbox value
                          });
                        },
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // You can add navigation logic here for forgot password
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
                height: 16,
              ),
              GradientElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyScreen(),
                        ));
                  },
                  text: 'Log in',
                  isRowButton: false),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 1.5,
                  color: Color.fromARGB(255, 193, 191, 191),
                ),
                Text(
                  'Or',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                Container(
                  width: 160,
                  height: 1.5,
                  color: const Color.fromARGB(255, 193, 191, 191),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Column(
            children: [
              Container(
                height: 48,
                width: widget.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 12,
                      child: Image.asset(
                        AssetPath.googleLogoUp,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Continue with google',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 48,
                width: widget.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Image.asset(
                        AssetPath.fbLogo,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Continue with facebook',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
