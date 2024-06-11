import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:card_app/features/wallet/presentation/functions/camera_detect_card.dart';
import 'package:card_app/main.dart';
import 'package:card_app/shared/functions/ss_print.dart';
import 'package:card_app/shared/widgets/bottom_navigation_bar/presentation/ss_bottom_navigation_bar.dart';
import 'package:card_app/shared/widgets/ss_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class AddWalletScreen extends StatefulWidget {
  const AddWalletScreen({super.key});

  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max, enableAudio: false);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late CameraController controller;
    // controller = CameraController(widget.descriptions[0], ResolutionPreset.high)..initialize();
    // 카메라 촬영 화면
    return SsLayout(
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();
                      ssPrint(image, 'AddWalletScreen');

                      context.push(DisplayPictureScreen.route, extra: image.path);

                      // MaterialPageRoute(
                      //   builder: (context) => DisplayPictureScreen(imagePath: image.path),
                      // );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Take a Picture')),
              const Text('앨범에서 가져오기'),
            ],
          )
        ],
      ),
      bottomNavigationBar: const SsBottomNavigationBar(),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  static String get route => '/detect_picture';

  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Column(
        children: [
          Image.file(File(imagePath)),
          ElevatedButton(
            onPressed: () async {
              // final recognizedText = await recognizeText(imagePath);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Recognized Text'),
                  // content: Text(recognizedText),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Recognize Text'),
          ),
        ],
      ),
    );
  }
}
