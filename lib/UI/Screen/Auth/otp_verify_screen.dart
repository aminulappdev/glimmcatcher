import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Auth/auth_screen.dart';
import 'package:glimmcatcher/UI/Screen/Auth/reset_password_screen.dart';
import 'package:glimmcatcher/UI/Widgets/auth_screen_background.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController otpCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: AuthScreenBackground(
          header: 'OTP Verify',
          title: 'Code has been send to abc@gmail.com',
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
                      otpFormBuild(height, width),
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

  Widget otpFormBuild(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PinCodeTextField(
            controller: otpCtrl,
            length: 4,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
                borderWidth: 0.2,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                inactiveColor: Colors.grey, // Border color when not filled
                fieldHeight: 60,
                fieldWidth: 70,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            appContext: context,
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
                        builder: (context) => AuthScreen(),
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
