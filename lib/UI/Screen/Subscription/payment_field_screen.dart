import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/payment_datails_screen.dart';
import 'package:glimmcatcher/UI/Widgets/gradiant_linear_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PaymentFieldScreen extends StatefulWidget {
  const PaymentFieldScreen({super.key});

  @override
  State<PaymentFieldScreen> createState() => _PaymentFieldScreenState();
}

class _PaymentFieldScreenState extends State<PaymentFieldScreen> {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  GradientText(
                    'Account Name',
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    gradientDirection: GradientDirection.ttb,
                    colors: [
                      Color(0xFFDB92FE),
                      Color(0xFFFBC774),
                    ],
                    gradientType: GradientType.linear,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.transparent,
                        hintText: 'Alex Carter',
                        hintStyle: GoogleFonts.nunito(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GradientText(
                    'Card Number',
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    gradientDirection: GradientDirection.ttb,
                    colors: [
                      Color(0xFFDB92FE),
                      Color(0xFFFBC774),
                    ],
                    gradientType: GradientType.linear,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        filled: true, // Enables fillColor
                        fillColor:
                            Colors.transparent, // Makes the background transparent
                        hintText: '123 123 123 123',
                        hintStyle: GoogleFonts.nunito(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              'Exp Date',
                              style: GoogleFonts.urbanist(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                              gradientDirection: GradientDirection.ttb,
                              colors: [
                                Color(0xFFDB92FE),
                                Color(0xFFFBC774),
                              ],
                              gradientType: GradientType.linear,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true, // Enables fillColor
                                    fillColor: Colors
                                        .transparent, // Makes the background transparent
                                    hintText: '123 123 123 123',
                                    hintStyle:
                                        GoogleFonts.nunito(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              'ccv',
                              style: GoogleFonts.urbanist(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                              gradientDirection: GradientDirection.ttb,
                              colors: [
                                Color(0xFFDB92FE),
                                Color(0xFFFBC774),
                              ],
                              gradientType: GradientType.linear,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    filled: true, // Enables fillColor
                                    fillColor: Colors
                                        .transparent, // Makes the background transparent
                                    hintText: '123 123 123 123',
                                    hintStyle:
                                        GoogleFonts.nunito(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                ],

              ),
              
              GradientElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDatailsFieldScreen(),));
                  }, text: 'Subscribe', isRowButton: false)
            ],
          ),
        ),
      ),
    );
  }
}
