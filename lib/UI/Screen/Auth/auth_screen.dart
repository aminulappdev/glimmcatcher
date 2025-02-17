import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Screen/Auth/tab_bar_login.dart';
import 'package:glimmcatcher/UI/Screen/Auth/tab_bar_signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool checkBox = false;
   bool isLoginTab = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: isLoginTab? 'Get Started now' : 'Sign up',
          title: isLoginTab? 'Create an account or log in to explore about our app' : 'Already have an account?',
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                loginSignupSection(width, context),
                isLoginTab ? 
                TabBarWithLogin(checkBox: checkBox, width: width) : SignUpTabBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginSignupSection(double width, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 232, 237),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 50,
                width: width / 2.3,
                decoration: BoxDecoration(
                    color: isLoginTab ? Color.fromARGB(255, 255, 255, 255) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      isLoginTab = true;
                      setState(() {
                        
                      });  
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 50,
                width: width / 2.3,
                decoration:
                    BoxDecoration(
                     color:  isLoginTab ? Colors.transparent : Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      isLoginTab = false;
                      setState(() {
                        
                      });                
                    },
                    child: Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


