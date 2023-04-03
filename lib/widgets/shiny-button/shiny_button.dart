import 'package:flutter/material.dart';
import 'package:shine_button/constants/constants.dart';
import 'package:shine_button/widgets/painter/painter.dart';
import 'package:shine_button/widgets/reflaction/reflaction.dart';

class ShinyButton extends StatefulWidget {
  const ShinyButton({super.key});

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with TickerProviderStateMixin {
  // CameraController to control the camera and get the preview of it
  // AnimationController to control the animation of the button
  late AnimationController _animationcontroller;

  @override
  void initState() {
    super.initState();
    // _animationcontroller is initialized with a duration of 50 milliseconds and the vsync is set to this
    _animationcontroller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
// _cameracontroller is initialized with the first camera in the list of cameras and the resolution is set to max
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector is used to detect the tap, tap down and tap cancel to give the button a pressed effect
    return GestureDetector(
      onTap: () => _animationcontroller.forward(),
      onTapDown: (_) => _animationcontroller.forward(),
      onTapCancel: () => _animationcontroller.reverse(),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: 0.95,
        ).animate(_animationcontroller),
        child: Material(
          elevation: 10,
          borderRadius: outterBorderRadius,
          child: Container(
            width: compnentWidth,
            height: compnentHeight,
            decoration: BoxDecoration(
              borderRadius: innerBorderRadius,
              border: Border.all(color: (Colors.grey[300])!, width: 3),
            ),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                const Reflaction(),
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
