import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController scrollController = ScrollController();

  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }   

    notifyListeners();    
    scrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = getYesNoAnswer.getAnswer();
    messageList.add(await herMessage);
    
    notifyListeners();    
    scrollToBottom();
  }

   Future<void>  scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
