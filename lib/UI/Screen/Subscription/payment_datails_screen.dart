import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 189, 240),
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
            colors: [
              Color.fromARGB(255, 224, 189, 240),
              Color.fromARGB(255, 241, 231, 245),
              Color.fromARGB(255, 255, 255, 255)
            ], // Define gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    
                    Container(
                      height: 400,
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffDB92FE),
                              Color(0xffFBC774),
                            ]),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Payment Tools',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
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
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                                Text(
                                  '31 Dec 2023',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Details',
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                                Text(
                                  'Residential',
                                ),
                              ],
                            ),
                              SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reference num',
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                                Text(
                                  'A06453826151',
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account',
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                                Text(
                                  'Neeraj',
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 24,
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Payment',
                                  style: GoogleFonts.roboto(color: Colors.white),
                                ),
                                Text(
                                  '\$9.99',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  '\$9.99',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110,
                      right: 110,
                      top: -50,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xffDB92FE),
                                  Color(0xffFBC774),
                                ]),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MainButtonNavbarScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Transparent background
                    foregroundColor: Colors.black, // Text color
                    shadowColor: Colors.transparent, // Remove shadow
                    side:
                        BorderSide(color: Colors.black, width: 1), // Black border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back,color: Colors.black,),
                        SizedBox(width: 4,),
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
    );
  }
}
