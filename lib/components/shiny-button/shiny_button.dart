import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shine_button/controllers/painter_controller.dart';
import 'package:shine_button/global/global.dart' as global;

class ShinyButton extends StatefulWidget {
  const ShinyButton({super.key});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton> {
  late CameraController _cameracontroller;
  final BorderRadius innerBorderRadius = BorderRadius.circular(50);
  final BorderRadius outterBorderRadius =
      const BorderRadius.all(Radius.circular(50));
  final double compnentWidth = 350;
  final double compnenHeight = 100.0;

  @override
  void initState() {
    super.initState();
    _cameracontroller =
        CameraController(global.cameras[0], ResolutionPreset.max);
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
    _cameracontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: outterBorderRadius,
      child: Container(
        width: compnentWidth,
        height: compnenHeight,
        decoration: BoxDecoration(
          borderRadius: innerBorderRadius,
          border: Border.all(color: Colors.grey, width: 3),
        ),
        child: GestureDetector(
          child: CustomPaint(
            size: Size(compnentWidth, compnenHeight),
            painter: SumdgePainter(),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: innerBorderRadius,
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.8), BlendMode.color),
                          child: SizedBox(
                              width: compnentWidth,
                              height: compnenHeight,
                              child: CameraPreview(_cameracontroller)),
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Button',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textScaleFactor: 1.8,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            //add smudging effect
          },
        ),
      ),
    );
  }
}
