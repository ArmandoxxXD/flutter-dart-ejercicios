import 'package:flutter/material.dart';
import 'package:mahs_yes_no_app/domain/entities/message.dart';
import 'package:mahs_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:mahs_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:mahs_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:mahs_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'data:image/jpeg;base64,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'),
          ),
        ),
        title: const Text('Armando'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.me)
                    ? MyMessage(message: message)
                    : HerMessage(message: message);
              },
            )),
            MessageFileBox(
              onValue: (value) => chatProvider.sendMessage(value),
              //onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
