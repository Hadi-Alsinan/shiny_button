import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/shiny-button/shiny_button.dart';
import 'global/global.dart' as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  global.cameras = await availableCameras();
  runApp(const ProviderScope(child: ShinnyButtonWrapper()));
}

class ShinnyButtonWrapper extends StatelessWidget {
  const ShinnyButtonWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: Scaffold(
          backgroundColor: Colors.white,
          body: const Center(child: ShinyButton())),
    );
  }
}
