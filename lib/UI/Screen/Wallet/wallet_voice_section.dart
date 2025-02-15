import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletVoiceScreen extends StatelessWidget {
  const WalletVoiceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Louis Hamilton',
                          style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(
                          height: 04,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              '18 January 2025',
                              style: GoogleFonts.urbanist(),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(AssetPath.music),
                              fit: BoxFit.fill),
                          color: Colors.transparent),
                    ),
                    Icon(
                      Icons.play_circle,
                      size: 32,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
