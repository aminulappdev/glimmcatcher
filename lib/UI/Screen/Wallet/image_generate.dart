import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/app_colors.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';

class ImageGenerateScreen extends StatefulWidget {
  const ImageGenerateScreen({super.key});

  @override
  State<ImageGenerateScreen> createState() => _ImageGenerateScreenState();
}

class _ImageGenerateScreenState extends State<ImageGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Stack(

            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetPath.women), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 102, 49, 107),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                   colors: AppColors.gradiantColors, ),
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              Icons.download,
              color: Colors.white,
            ),
          ),)
            ],
          );
        },
      ),
    );
  }
}
