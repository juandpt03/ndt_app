import 'package:flutter/material.dart';

class OgBackGround extends StatelessWidget {
  const OgBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return CustomPaint(
      painter: TrianglesPainter(
        color1: colors.primary,
        color2: colors.secondary,
      ),
      size: size,
    );
  }
}

class TrianglesPainter extends CustomPainter {
  final Color color1;
  final Color color2;

  final Paint paint1, paint2;

  TrianglesPainter({
    required this.color1,
    required this.color2,
  })  : paint1 = Paint()
          ..color = color1
          ..style = PaintingStyle.fill
          ..blendMode = BlendMode.colorBurn,
        paint2 = Paint()
          ..color = color2
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    drawTriangle2(canvas, size);
    drawTriangle1(canvas, size);
  }

  void drawTriangle1(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(size.width, size.height * 1 / 2)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint1);
  }

  void drawTriangle2(Canvas canvas, Size size) {
    Path path = Path()
      ..moveTo(0, size.height * 1 / 2)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
