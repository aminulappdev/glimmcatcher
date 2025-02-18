import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/image_generate.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_text_screen.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_voice_section.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletBarScreenState extends StatefulWidget {
  const WalletBarScreenState({super.key});

  @override
  State<WalletBarScreenState> createState() => _WalletBarScreenStateState();
}

class _WalletBarScreenStateState extends State<WalletBarScreenState> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Wallet',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(height / 72),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        selectedPage = 0;
                        setState(() {});
                      },
                      child: Text(
                        'Text',
                        style: TextStyle(
                            decorationColor: AppColors.themeColor,
                            decoration: selectedPage == 0
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w400,
                            color: selectedPage == 0
                                ? AppColors.themeColor
                                : Colors.black),
                      )),
                  GestureDetector(
                      onTap: () {
                        selectedPage = 1;
                        setState(() {});
                      },
                      child: Text(
                        'Voice',
                        style: TextStyle(
                            decorationColor: AppColors.themeColor,
                            decoration: selectedPage == 1
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w400,
                            color: selectedPage == 1
                                ? AppColors.themeColor
                                : Colors.black),
                      )),
                  GestureDetector(
                      onTap: () {
                        selectedPage = 2;
                        setState(() {});
                      },
                      child: Text(
                        'Image/Video',
                        style: TextStyle(
                            decorationColor: AppColors.themeColor,
                            decoration: selectedPage == 2
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w400,
                            color: selectedPage == 2
                                ? AppColors.themeColor
                                : Colors.black),
                      )),
                  GestureDetector(
                      onTap: () {
                        selectedPage = 3;
                        setState(() {});
                      },
                      child: Text(
                        'AI Generate',
                        style: TextStyle(
                            decorationColor: AppColors.themeColor,
                            decoration: selectedPage == 3
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontSize: height / 50,
                            fontWeight: FontWeight.w400,
                            color: selectedPage == 3
                                ? AppColors.themeColor
                                : Colors.black),
                      )),
                ],
              ),
              if (selectedPage == 0) ...{
                WalletTextScreen(),
              } else if (selectedPage == 1) ...{
                WalletVoiceScreen()
              } else if (selectedPage == 2) ...{
                ImageGenerateScreen()
              } else if (selectedPage == 3) ...{
                ImageGenerateScreen()
              }
            ],
          ),
        ),
      ),
    );
  }
}
