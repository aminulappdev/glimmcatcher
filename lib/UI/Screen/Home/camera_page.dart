import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:glimmcatcher/UI/Utils/asset_path.dart';

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
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
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
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          /// 📌 Camera Switch & Flash Buttons
          Positioned(
            top: 60,
            right: 20,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.cameraswitch,
                      color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.setFlashMode(FlashMode.auto);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.flash_auto,
                      color: Colors.white, size: 30),
                  onPressed: toggleCamera,
                ),
                 IconButton(
                  icon: const Icon(Icons.text_fields,
                      color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.setFlashMode(FlashMode.auto);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.open_in_full,
                      color: Colors.white, size: 30),
                  onPressed: toggleCamera,
                ),
              ],

            ),
          ),

          /// 📌 Floating Capture Button
          Positioned(
            bottom: 120,
            left: 120,
            child: SizedBox(
              width: 160,
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
                      child: Text('Photo',style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Center(
                      child: Text('Video',style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Center(
                      child: Text('Live',style: TextStyle(fontSize: 12),),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),

          /// 📌 Floating Capture Button
          Positioned(
            bottom: 40,
            left: 100,
            child: SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(AssetPath.aiGenerate),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        'Effects',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: takePicture,
                    child: Container(
                      width: 60,
                      height: 60,
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
                  Column(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(AssetPath.aiGenerate),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        'Effects',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
