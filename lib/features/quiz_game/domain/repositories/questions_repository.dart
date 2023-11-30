import 'package:ndt_app/features/quiz_game/domain/domain.dart';

abstract class QuestionsRespository {
  Future<List<Question>> getQuestions();
}
