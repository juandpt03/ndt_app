import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';

final dataProvider = FutureProvider<List>((ref) {
  return ref.watch(dataRepositoryProvider).getContent();
});
