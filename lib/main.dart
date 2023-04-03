import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shine_button/widgets/shiny-button/shiny_button.dart';
import 'global/global.dart' as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // make sure to initialize the cameras during the app initialization and save it in a global variable
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
     
      home: const Scaffold(
          backgroundColor: Colors.white,
          body:  Center(child: ShinyButton())),
    );
  }
}
