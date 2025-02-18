import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraApp({super.key, required this.cameras});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController? controller;
  bool isRearCamera = true;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  double _minZoom = 1.0;
  double _maxZoom = 1.0;
  int _pointers = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera(isRearCamera ? 0 : 1);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera(int cameraIndex) async {
    final cameras = widget.cameras;

    if (cameras.isEmpty) {
      debugPrint("No cameras available");
      return;
    }

    controller = CameraController(
      cameras[cameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await controller!.initialize();
    _minZoom = await controller!.getMinZoomLevel();
    _maxZoom = await controller!.getMaxZoomLevel();

    if (!mounted) return;
    setState(() {});
  }

  void toggleCamera() {
    setState(() {
      isRearCamera = !isRearCamera;
    });
    _initializeCamera(isRearCamera ? 0 : 1);
  }

  void takePicture() async {
    if (controller == null || !controller!.value.isInitialized) return;

    try {
      final image = await controller!.takePicture();
      debugPrint("Image saved at: ${image.path}");
    } catch (e) {
      debugPrint("Error capturing image: $e");
    }
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    if (controller == null || _pointers != 2) return;
    _currentScale = (_baseScale * details.scale).clamp(_minZoom, _maxZoom);
    await controller!.setZoomLevel(_currentScale);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onScaleStart: _handleScaleStart,
              onScaleUpdate: _handleScaleUpdate,
              child: CameraPreview(controller!),
            ),

            /// 📌 Back Button
            Positioned(
              top: height / 20,
              left: width / 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Colors.white, size: height / 28),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            /// 📌 Camera Switch & Flash Buttons
            Positioned(
              top: height / 16,
              right: width / 16,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.cameraswitch,
                        color: Colors.white, size: height / 24),
                    onPressed: () async {
                      await controller?.setFlashMode(FlashMode.auto);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.flash_auto,
                        color: Colors.white, size: height / 24),
                    onPressed: toggleCamera,
                  ),
                  IconButton(
                    icon: Icon(Icons.text_fields,
                        color: Colors.white, size: height / 24),
                    onPressed: () async {
                      await controller?.setFlashMode(FlashMode.auto);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.open_in_full,
                        color: Colors.white, size: height / 24),
                    onPressed: toggleCamera,
                  ),
                ],
              ),
            ),

            /// 📌 Floating Capture Button
            Positioned(
              bottom: height / 7,
              left: width / 3,
              child: SizedBox(
                width: width / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 22,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Photo',
                          style: TextStyle(fontSize: height / 68),
                        ),
                      ),
                    ),
                    Container(
                      height: 22,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          'Video',
                          style: TextStyle(fontSize: height / 68),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 📌 Floating Capture Button
            Positioned(
              bottom: height / 20,
              left: width / 2.35,
              child: GestureDetector(
                onTap: takePicture,
                child: Container(
                  height: height / 14,
                  width: height / 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.camera_alt,
                      size: 40, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
