import 'package:ndt_app/features/quiz_game/domain/domain.dart';

abstract class QuestionsDataSource {
  Future<List<Question>> getQuestions();
}
