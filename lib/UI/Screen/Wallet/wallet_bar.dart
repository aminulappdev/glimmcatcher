import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/image_generate.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_text_screen.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_voice_section.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: selectedPage == 0 ? Colors.red : Colors.black
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      selectedPage = 1;
                      setState(() {});
                    },
                    child: Text(
                      'Voice',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: selectedPage == 1 ? Colors.red : Colors.black
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      selectedPage = 2;
                      setState(() {});
                    },
                    child: Text(
                      'Image/Video',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: selectedPage == 2 ? Colors.red : Colors.black
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      selectedPage = 3;
                      setState(() {});
                    },
                    child: Text(
                      'AI Generate',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: selectedPage == 3 ? Colors.red : Colors.black
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 14,
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
    );
  }
}
