import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreenBackground extends StatelessWidget {
  const AuthScreenBackground(
      {super.key,
      required this.header,
      required this.title,
      required this.child});
  final String header;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return 
      Stack(
        children: [
          // SvgPicture.asset(
          //   AssetPath.backgroundSvg,
          //   height: height,
          //   width: width,
          //   fit: BoxFit.fill,
          // ),
      
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AssetPath.backgroundSJPG,
                    ),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetPath.logoWhite,
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    header,
                    style: GoogleFonts.inter(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30)),
              height: height,
              width: width,
              child: child,
            ),
          )
        ],
      );
    
  }
}
