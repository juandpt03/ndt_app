import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/quiz_game/domain/domain.dart';
import 'package:ndt_app/features/quiz_game/presentation/providers/providers.dart';

final questionsProvider = FutureProvider<List<Question>>((ref) async {
  return await ref.watch(questionsRepositoryProvider).getQuestions();
});
