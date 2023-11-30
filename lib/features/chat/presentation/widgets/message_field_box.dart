import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    final underLineInputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
    final inputDecoration = InputDecoration(
      hintText: 'End your Message with "?" ',
      enabledBorder: underLineInputBorder,
      focusedBorder: underLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
