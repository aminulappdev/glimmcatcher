import 'package:flutter/material.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isRowButton;
  const GradientElevatedButton({super.key, required this.onPressed, required this.text, required this.isRowButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFDB92FE),
            Color(0xFFFBC774)
          ], // Define gradient colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child:isRowButton ? elevatedwithRow() : elevatedButton(),
    );
  }

  ElevatedButton elevatedwithRow() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        backgroundColor: Colors.transparent, // Make background transparent
        shadowColor: Colors.transparent, // Remove default shadow
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            width: 255,
          ),
          Icon(
            Icons.arrow_forward_sharp,
            color: Colors.white,
            size: 18,
          )
        ],
      ),
    );
  }

  ElevatedButton elevatedButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        backgroundColor: Colors.transparent, // Make background transparent
        shadowColor: Colors.transparent, // Remove default shadow
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
