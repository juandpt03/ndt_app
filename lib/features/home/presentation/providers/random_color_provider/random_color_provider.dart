import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomColorProvider = StateProvider.autoDispose<List<Color>>((ref) {
  final rnd = Random();

  Color getColor() {
    int min = 150;
    int max = 255;

    int r = rnd.nextInt(max - min) + min;
    int g = rnd.nextInt(max - min) + min;
    int b = rnd.nextInt(max - min) + min;

    return Color.fromRGBO(r, g, b, 1);
  }

  return [
    getColor(),
    getColor(),
    getColor(),
    getColor(),
  ];
});
