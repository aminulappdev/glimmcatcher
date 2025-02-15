import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';

class ImageGenerateScreen extends StatefulWidget {
  const ImageGenerateScreen({super.key});

  @override
  State<ImageGenerateScreen> createState() => _ImageGenerateScreenState();
}

class _ImageGenerateScreenState extends State<ImageGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AssetPath.women),fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 102, 49, 107),
                        ),
                      );
                    },
                  ),);
  }
}