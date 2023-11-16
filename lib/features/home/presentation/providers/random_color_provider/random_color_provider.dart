import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomColorProvider = StateProvider.autoDispose<List<Color>>((ref) {
  final rnd = Random();

  Color getColor() {
    int b = rnd.nextInt(255);
    int r = rnd.nextInt(255);
    int g = rnd.nextInt(255);
    return Color.fromRGBO(r, g, b, 0.5);
  }

  return [
    getColor(),
    getColor(),
    getColor(),
    getColor(),
  ];
});
