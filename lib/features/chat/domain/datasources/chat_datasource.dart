import 'package:ndt_app/features/chat/domain/domain.dart';

abstract class ChatDataSource {
  Future<List<Message>> getAnswer();
}
