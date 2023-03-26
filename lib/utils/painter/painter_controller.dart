import 'dart:ui';
import 'package:flutter/material.dart';

class SumdgePainter extends CustomPainter {
  final List<Offset> points;

  SumdgePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.grey.withOpacity(0.6);
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 7.0);
    paint.strokeWidth = 35.0;
    paint.strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
