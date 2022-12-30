import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SquareWithRoundedCornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw a square with a rounded corner in the bottom right
    var path = Path();
    path.moveTo(50, 50);
    path.lineTo(size.width, 50);
    path.lineTo(size.width, size.height);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: Radius.circular(100),
      clockwise: false,
    );
    path.lineTo(50, size.height);
    path.close();

    Paint paint1 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}