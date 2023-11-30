import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
