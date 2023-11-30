import 'package:ndt_app/features/quiz_game/domain/domain.dart';

class QuestionsRepositoryImpl extends QuestionsRespository {
  final QuestionsDataSource questionsDataSource;

  QuestionsRepositoryImpl({required this.questionsDataSource});
  @override
  Future<List<Question>> getQuestions() async {
    return await questionsDataSource.getQuestions();
  }
}
