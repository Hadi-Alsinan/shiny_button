import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class SumdgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset startPoint = Offset(0, 0);
    Offset endPoint = Offset(size.width, size.height);
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 5;
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
