import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shine_button/global/global.dart' as global;
import 'package:shine_button/constants/constants.dart';

class Reflaction extends StatefulWidget {
  const Reflaction({super.key});

  @override
  State<Reflaction> createState() => _ReflactionState();
}

class _ReflactionState extends State<Reflaction> {
  // _cameracontroller is initialized with the first camera in the list of cameras and the resolution is set to max
  late CameraController _cameracontroller;
  // frontCamera is used to get the front camera from the list of cameras
  final frontCamera = global.cameras[1];
  @override
  void initState() {
    super.initState();
    _cameracontroller =
        CameraController(frontCamera, ResolutionPreset.max);
    _cameracontroller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ClipRRect is used to change the shape of the camerapreview and apply the imagefilters to it
    return ClipRRect(
      borderRadius: innerBorderRadius,
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.6), BlendMode.color),
              child: SizedBox(
                  width: compnentWidth,
                  height: compnentHeight,
                  child: CameraPreview(_cameracontroller)),
            ),
          ),
        ),
      ),
    );
  }
}
