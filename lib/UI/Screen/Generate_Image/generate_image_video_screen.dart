import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:image_picker/image_picker.dart';

class GenerateImageVideoScreen extends StatefulWidget {
  const GenerateImageVideoScreen({super.key});

  @override
  State<GenerateImageVideoScreen> createState() =>
      _GenerateImageVideoScreenState();
}

class _GenerateImageVideoScreenState extends State<GenerateImageVideoScreen> {
  File? image;

  Future<void> _pickImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    } finally {
      if (mounted) Navigator.pop(context);
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    } finally {
      if (mounted) Navigator.pop(context);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Image/Video',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(height / 72),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 72,
                  ),
                  Text(
                    'Enter Title',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600, fontSize: height / 46),
                  ),
                  SizedBox(
                    height: height / 72,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please type';
                      }
                      return null;
                    },
                    maxLines: 1,
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
                  Text(
                    'Descriptions',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600, fontSize: height / 46),
                  ),
                  SizedBox(
                    height: height / 72,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please type';
                      }
                      return null;
                    },
                    maxLines: 4,
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
                  Text(
                    'Upload',
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600, fontSize: height / 46),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.fill,
                            height: height / 2.5,
                            width: width,
                          ),
                        )
                      : uploadPhotoSection(context, height, width),
                  SizedBox(
                    height: height / 48,
                  ),
                  captureButton(context, height, width),
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
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        'Save',
                        style: GoogleFonts.urbanist(
                            fontSize: height / 46, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadPhotoSection(BuildContext context, double height, double width) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      padding: EdgeInsets.all(height / 200),
      color: Colors.black,
      strokeWidth: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: SizedBox(
          height: height / 8,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height / 16,
                  width: height / 16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetPath.downloadLight),
                          fit: BoxFit.fill)),
                ),
                Text(
                  'Drop your imager here, or browse jpg, png are allowed',
                  style: TextStyle(fontSize: height / 68),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget captureButton(BuildContext context, double height, double width) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showAlertDialog(context);
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(50),
          padding: EdgeInsets.all(6),
          color: AppColors.themeColor,
          strokeWidth: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: SizedBox(
              height: height / 24,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Capture',
                      style:
                          TextStyle(fontSize: height / 50, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: AppColors.gradiantColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _pickImageFromCamera();
                  },
                  icon: const Icon(Icons.camera_alt, size: 40),
                ),
                IconButton(
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                  icon: const Icon(Icons.photo_library, size: 40),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
