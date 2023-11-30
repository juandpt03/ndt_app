import 'package:ndt_app/features/chat/domain/domain.dart';

abstract class ChatRepository {
  Future<List<Message>> getAnswer();
}
