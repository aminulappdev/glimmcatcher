import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentDatailsFieldScreen extends StatefulWidget {
  const PaymentDatailsFieldScreen({super.key});

  @override
  State<PaymentDatailsFieldScreen> createState() =>
      _PaymentDatailsFieldScreenState();
}

class _PaymentDatailsFieldScreenState extends State<PaymentDatailsFieldScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.subscriotionAppBarColor,
          title: Text(
            'Payment',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.subscriotionGradiantrColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(height / 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: datailsBox(height, width),
                ),
                SizedBox(
                  width: width / 1.4,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainButtonNavbarScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Transparent background
                      foregroundColor: Colors.black, // Text color
                      shadowColor: Colors.transparent, // Remove shadow
                      side: BorderSide(
                          color: Colors.black, width: 1), // Black border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('Back to Homepage'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget datailsBox(double height, double width) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height / 2.2,
          width: width / 1.3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.gradiantColors,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 28,
                    ),
                    Text(
                      'Payment Tools',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: height / 50,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$9.99',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    customRow('Date', '31 Dec 2023'),
                    SizedBox(
                      height: height / 80,
                    ),
                    customRow('Details', 'Residential'),
                    SizedBox(
                      height: height / 80,
                    ),
                    customRow('Reference num', 'A06453826151'),
                    SizedBox(
                      height: height / 80,
                    ),
                    customRow('Account', 'Neeraj'),
                    SizedBox(
                      height: height / 28,
                    ),
                    customRow('Total Payment', '\$9.99'),
                    SizedBox(
                      height: height / 80,
                    ),
                    customRow('Total', '\$9.99'),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: width / 3.6,
          right: width / 3.6,
          top: -(height / 18),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.gradiantColors,
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Icon(
                Icons.done,
                size: height / 18,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Row customRow(String name, String context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        Text(
          context,
        ),
      ],
    );
  }
}
