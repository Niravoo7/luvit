import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/core/constants/string_constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(StringConstants.strChat.tr),
      ),
    );
  }
}
