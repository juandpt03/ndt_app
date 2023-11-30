import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:ndt_app/features/chat/domain/domain.dart';

class Gpt3DataSource extends ChatDataSource {
  OpenAI openAI = OpenAI.instance.build(
    token: kTokenKey,
    baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20)),
    enableLog: true,
  );

  @override
  Future<List<Message>> getAnswer() {
    // TODO: implement getAnswer
    throw UnimplementedError();
  }
}
