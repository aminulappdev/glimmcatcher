import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

  File? image;

  Future<void> _pickImageFromCamera() async {
  try {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
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
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
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

  Future<XFile> _compressImage(File image) async {
    final compressImage = await FlutterImageCompress.compressAndGetFile(
        image.absolute.path, '${image.path}_compress.jpg');
    return compressImage!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          radius: 45,
                          child: image != null
                              ? ClipOval(
                                  child: Image.file(
                                    image!,
                                    width: 120,
                                    height: 120,
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
                    height: 4,
                  ),
                  buildForm(),
                ],
              ),
              ElevatedButton(
                onPressed: elevatedButton,
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Email address',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'example@gmail.com',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Phone Number',
            style: TextStyle(
                color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
          ),
          IntlPhoneField(
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
                color: const Color.fromARGB(255, 137, 136, 136), fontSize: 16),
          ),
          SizedBox(
            height: 8,
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
                  style: TextStyle(color: Colors.grey, fontSize: 16),
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
            width: 100,
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainButtonNavbarScreen()),
    );
  }
}
