import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:ndt_app/config/constants/enviroment.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _openAI = OpenAI.instance.build(
    token: Enviroment.chatGptApiKey,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    ),
    enableLog: true,
  );
  final ChatUser _currentUser = ChatUser(
    id: '1',
    firstName: 'Estudiante',
    lastName: 'END',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Wave',
    lastName: 'Chat',
  );
  final List<ChatMessage> _messages = <ChatMessage>[];
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wave Chat',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        backgroundColor: isDark
            ? colors.primaryContainer.withOpacity(0.8)
            : Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: DashChat(
        inputOptions: const InputOptions(
          inputTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        messageOptions: MessageOptions(
          currentUserContainerColor: colors.primaryContainer,
          currentUserTextColor: colors.primary,
          containerColor: colors.secondaryContainer,
        ),
        currentUser: _currentUser,
        onSend: (ChatMessage message) {
          getChatRespose(message);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getChatRespose(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });
    List<Messages> messagesHistory = _messages.reversed.map((message) {
      if (message.user == _currentUser) {
        return Messages(role: Role.user, content: message.text);
      } else {
        return Messages(role: Role.assistant, content: message.text);
      }
    }).toList();
    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: messagesHistory,
      maxToken: 200,
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(
              user: _gptChatUser,
              createdAt: DateTime.now(),
              text: element.message!.content,
            ),
          );
        });
      }
    }
  }
}
