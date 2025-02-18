import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/main_bottom_navbar_screen.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  String? selectedGender;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  // Future<XFile> _compressImage(File image) async {
  //   final compressImage = await FlutterImageCompress.compressAndGetFile(
  //       image.absolute.path, '${image.path}_compress.jpg');
  //   return compressImage!;
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit profile',
            style: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(height / 58),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(AssetPath.aiGenerate),
                              radius: height / 22,
                              child: image != null
                                  ? ClipOval(
                                      child: Image.file(
                                        image!,
                                        width: height / 11,
                                        height: height / 11,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  icon: Icon(
                                    Icons.camera,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 200,
                      ),
                      buildForm(height, width),
                    ],
                  ),
                  SizedBox(
                    height: height / 7,
                  ),
                  ElevatedButton(
                    onPressed: elevatedButton,
                    child: Text('Update'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form buildForm(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter name';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          ),
          SizedBox(
            height: height / 100,
          ),
          Text(
            'Email address',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 200,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }
              if (EmailValidator.validate(value) == false) {
                return 'Enter a valid email address';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'example@gmail.com',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          ),
          SizedBox(
            height: height / 100,
          ),
          Text(
            'Phone Number',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          IntlPhoneField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              hintText: '(+880) 1731-25',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            initialCountryCode: 'BD', // Default country code
            onChanged: (phone) {},
          ),
          Text(
            'Gender',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136),
                fontSize: height / 50),
          ),
          SizedBox(
            height: height / 100,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: 'Gander',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: selectedGender,
            items: ["Male", "Female"].map((String gender) {
              return DropdownMenuItem(
                value: gender,
                child: Text(
                  gender,
                  style: TextStyle(color: Colors.grey, fontSize: height / 50),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
          ),
        ],
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

  Future<void> elevatedButton() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainButtonNavbarScreen()),
      );
    }
  }
}
