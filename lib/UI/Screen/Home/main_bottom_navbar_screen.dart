import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Screen/Home/camera_page.dart';
import 'package:glimmcatcher/UI/Screen/Home/homepage.dart';
import 'package:glimmcatcher/UI/Screen/Home/profile_update_screen.dart';
import 'package:glimmcatcher/UI/Screen/Subscription/subscription_screen.dart';
import 'package:glimmcatcher/UI/Screen/Wallet/wallet_bar.dart';

class MainButtonNavbarScreen extends StatefulWidget {
  const MainButtonNavbarScreen({super.key});

  @override
  State<MainButtonNavbarScreen> createState() => _MainButtonNavbarScreenState();
}

class _MainButtonNavbarScreenState extends State<MainButtonNavbarScreen> {
  int selectedKey = 0;
  List<CameraDescription>? cameras; // Nullable to handle initialization

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Initialize Camera
  Future<void> _initializeCamera() async {
    final availableCamerasList = await availableCameras();
    setState(() {
      cameras = availableCamerasList;
    });
  }

  List<Widget> get screens => [
        const Homepage(),
        const SubscriptionScreen(),
        WalletBarScreenState(),
        const ProfileUpdateScreen(),
      ];

  void updateSelectedKey(int index) {
    setState(() {
      selectedKey = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedKey], // Display selected screen
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: const Color(0xFF585574),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined,
                    color:
                        selectedKey == 0 ? Colors.white : Colors.purple[200]),
                onPressed: () => updateSelectedKey(0),
              ),
              IconButton(
                icon: Icon(Icons.emoji_events,
                    color:
                        selectedKey == 1 ? Colors.white : Colors.purple[200]),
                onPressed: () => updateSelectedKey(1),
              ),
              const SizedBox(width: 40), // Space for FAB
              IconButton(
                icon: Icon(Icons.account_balance_wallet,
                    color:
                        selectedKey == 2 ? Colors.white : Colors.purple[200]),
                onPressed: () => updateSelectedKey(2),
              ),
              IconButton(
                icon: Icon(Icons.person_outline,
                    color:
                        selectedKey == 3 ? Colors.white : Colors.purple[200]),
                onPressed: () => updateSelectedKey(3),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)), // Custom shape
          backgroundColor: Colors.purple[300],
          onPressed: () {
            if (cameras != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraApp(cameras: cameras!),
                ),
              );
            }
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
