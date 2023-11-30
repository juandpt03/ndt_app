// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ndt_app/features/chat/domain/domain.dart';


// final chatProvider = StateNotifierProvider<ChatNotifier, List<Message>>((ref) {
//   return ChatNotifier();
// });

// class ChatNotifier extends StateNotifier<List<Message>> {
//   ChatNotifier() : super([]);
//   final ScrollController chatScrollController = ScrollController();
//   final getYesNoAnswer = GetYesNoAnswer();

//   Future<void> sendMessage(String text) async {
//     if (text.isEmpty) return;

//     state = [...state, (Message(text: text, fromWho: FromWho.mine))];
//     if (text.endsWith('?')) {
//       await herReply();
//     }
//     moveScrollToBottom();
//   }

//   Future<void> moveScrollToBottom() async {
//     await Future.delayed(
//       const Duration(milliseconds: 100),
//     );
//     chatScrollController.animateTo(
//         chatScrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut);
//   }

//   Future<void> herReply() async {
//     final herMessage = await getYesNoAnswer.getAnswer();
//     state = [...state, herMessage];

//     moveScrollToBottom();
//   }
// }
