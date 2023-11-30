import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndt_app/features/quiz_game/domain/domain.dart';
import 'package:ndt_app/features/quiz_game/infrastructure/datasources/questions_datasources_impl.dart';
import 'package:ndt_app/features/quiz_game/infrastructure/respositories/questions_repository_impl.dart';

final questionsRepositoryProvider = StateProvider<QuestionsRespository>((ref) {
  return QuestionsRepositoryImpl(
    questionsDataSource: QuestionsDataSourcesImpl(),
  );
});
