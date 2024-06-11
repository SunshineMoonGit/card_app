import 'package:camera/camera.dart';
import 'package:card_app/core/app.dart';
import 'package:card_app/core/observers.dart';
import 'package:card_app/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  await initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const App(),
    ),
  );
}
