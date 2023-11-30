import 'package:ndt_app/features/chat/domain/domain.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDataSource chatDataSource;

  ChatRepositoryImpl({required this.chatDataSource});
  @override
  Future<List<Message>> getAnswer() async {
    return await chatDataSource.getAnswer();
  }
}
