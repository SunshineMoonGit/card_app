import 'package:camera/camera.dart';
import 'package:card_app/config/app/app_string.dart';
import 'package:card_app/core/app.dart';
import 'package:card_app/core/observers.dart';
import 'package:card_app/di/injector.dart';
import 'package:card_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  cameras = await availableCameras();

  await Hive.initFlutter();
  await Hive.openBox(AppString.auth);
  await Hive.openBox(AppString.followings);
  await Hive.openBox(AppString.setting);

  await initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();

  runApp(
    ProviderScope(
      observers: [Observers()],
      child: const App(),
    ),
  );
}
