import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/homepage.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/subscription_screen.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_bar.dart';

class MainButtonNavbarScreen extends StatefulWidget {
  const MainButtonNavbarScreen({super.key});

  @override
  State<MainButtonNavbarScreen> createState() => _MainButtonNavbarScreenState();
}

class _MainButtonNavbarScreenState extends State<MainButtonNavbarScreen> {
  int selectedKey = 0;

  // Dummy screens (Replace these with your actual screens)
 List<Widget> screens = const [
    Homepage(),
    SubscriptionScreen(),
    WalletBarScreenState(),
    Homepage(),
  ];

  @override
  void initState() {
    super.initState();
    print('Hello, I am the main screen');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedKey], // Display selected screen
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(), // Creates the notch
          notchMargin: 8.0,
          color: Color(0xFF585574), // Background color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.new_label,
                      color:
                          selectedKey == 0 ? Colors.white : Colors.purple[200]),
                  onPressed: () => setState(() => selectedKey = 0)),
              IconButton(
                  icon: Icon(Icons.check_box,
                      color:
                          selectedKey == 1 ? Colors.white : Colors.purple[200]),
                  onPressed: () => setState(() => selectedKey = 1)),
              SizedBox(width: 40), // Space for FAB
              IconButton(
                  icon: Icon(Icons.close,
                      color:
                          selectedKey == 2 ? Colors.white : Colors.purple[200]),
                  onPressed: () => setState(() => selectedKey = 2)),
              IconButton(
                  icon: Icon(Icons.circle,
                      color:
                          selectedKey == 3 ? Colors.white : Colors.purple[200]),
                  onPressed: () => setState(() => selectedKey = 3)),
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
      ),
    );
  }
}
