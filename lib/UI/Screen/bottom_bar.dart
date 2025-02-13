import 'package:flutter/material.dart';

class bottomAppBAr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.purple[800], // Adjust to match your design
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home, color: Colors.purple[200]),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.emoji_events, color: Colors.purple[200]),
                onPressed: () {}),
            SizedBox(width: 40), // Space for FloatingActionButton
            IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.purple[200]),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.person, color: Colors.purple[200]),
                onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)), // Custom shape
        backgroundColor: Colors.purple[300],
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
