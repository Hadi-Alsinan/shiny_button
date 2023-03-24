import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class SumdgePainter extends CustomPainter {
  final List<Offset> points;

  SumdgePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = Colors.grey.withOpacity(0.8);
    paint.strokeWidth = 25.0;
    paint.strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
