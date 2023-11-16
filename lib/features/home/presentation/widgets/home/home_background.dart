import 'dart:math';
import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedCrossedWaves();
  }
}

class AnimatedCrossedWaves extends StatefulWidget {
  const AnimatedCrossedWaves({super.key});

  @override
  AnimatedCrossedWavesState createState() => AnimatedCrossedWavesState();
}

class AnimatedCrossedWavesState extends State<AnimatedCrossedWaves>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: AnimatedCrossedWavesPainter(
        animation: _animation,
        colors: Colors.white12,
      ),
      size: size,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCrossedWavesPainter extends CustomPainter {
  final Color colors;
  final Animation<double> animation;

  AnimatedCrossedWavesPainter({
    required this.animation,
    required this.colors,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colors
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Parámetros ajustables
    const amplitude = 30;
    const frequency1 = 0.02;
    const frequency2 = 0.015;
    const waveCount = 1;

    // Calculamos la posición de inicio basada en el valor de la animación
    final startOffset = size.width * (1 - animation.value);

    // Iniciamos el path desde el borde izquierdo
    path.moveTo(startOffset, size.height / 2);

    // Dibujamos las ondas cruzadas con el valor de la animación para desplazarlas
    for (double i = startOffset; i < size.width + startOffset; i++) {
      final offset = size.width * animation.value;
      final y1 = size.height / 2 +
          amplitude *
              sin(frequency1 * (i - offset)) *
              cos(waveCount * frequency1 * (i - offset));
      final y2 = size.height / 2 +
          amplitude *
              sin(frequency2 * (i - offset)) *
              cos(waveCount * frequency2 * (i - offset));

      // Dibujamos una línea vertical que cruza las ondas
      path.lineTo(i, y1);
      path.lineTo(i, y2);
    }

    // Conectamos con el borde inferior derecho
    path.lineTo(size.width + startOffset, size.height);

    // Dibujamos el fondo con el path y el color
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
