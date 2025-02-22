import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Text',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(height / 72),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 72),
                Text(
                  'Enter Text',
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600, fontSize: height / 46),
                ),
                SizedBox(height: height / 72),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please type';
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Type anything',
                    enabledBorder: GradientOutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gradient:
                            LinearGradient(colors: AppColors.gradiantColors),
                        width: 1),
                  ),
                ),
                SizedBox(
                  height: height / 48,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainButtonNavbarScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: height / 46),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
