import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shine_button/global/global.dart' as global;
import 'package:shine_button/constants/constants.dart';
import 'package:shine_button/widgets/painter/painter.dart';

class ShinyButton extends StatefulWidget {
  const ShinyButton({super.key});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with TickerProviderStateMixin {
  // CameraController to control the camera and get the preview of it
  late CameraController _cameracontroller;
  // AnimationController to control the animation of the button
  late AnimationController _animationcontroller;

  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
// _cameracontroller is initialized with the first camera in the list of cameras
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
    _animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationcontroller.forward(),
      onTapCancel: () => _animationcontroller.reverse(),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).animate(_animationcontroller),
        child: Material(
          elevation: 20,
          borderRadius: outterBorderRadius,
          child: Container(
            width: compnentWidth,
            height: compnentHeight,
            decoration: BoxDecoration(
              borderRadius: innerBorderRadius,
              border: Border.all(color: Colors.grey, width: 3),
            ),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                // ClipRRect is used to change the shape of the camerapreview and apply the imagefilters to it
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
                              height: compnentHeight,
                              child: CameraPreview(_cameracontroller)),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Button',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                    textScaleFactor: 1.8,
                  ),
                ),
                const Painter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
