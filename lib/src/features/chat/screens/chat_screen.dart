import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading:BackButton(
            color: kBlack,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Chat'),
          backgroundColor: kWhite,
          titleTextStyle: const TextStyle(
            color: kBlack,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        body: Chat(
          theme: const DefaultChatTheme(
            sendButtonIcon: Icon(Icons.send),
            inputBackgroundColor: Colors.white,
            inputTextColor: Colors.black,
            inputBorderRadius: BorderRadius.all(Radius.circular(0)),
            inputMargin: EdgeInsets.all(20),
            inputPadding: EdgeInsets.all(20),
            backgroundColor: Color.fromARGB(255, 172, 231, 170),
            inputTextCursorColor: Color.fromARGB(255, 4, 115, 0),
          ),
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
}
