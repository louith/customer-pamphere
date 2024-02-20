import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/components/constants.dart';
import 'package:customer/components/form_container_widget.dart';
import 'package:customer/components/widgets.dart';
import 'package:customer/screens/Chat/chatBubble.dart';
import 'package:customer/screens/Chat/chatservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IndivChat extends StatefulWidget {
  String userName;
  IndivChat({super.key, required this.userName});

  @override
  State<IndivChat> createState() => _IndivChatState();
}

class _IndivChatState extends State<IndivChat> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices chatServices = ChatServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      try {
        await chatServices.sendMessage(
            widget.userName, _messageController.text);
      } catch (e) {
        log('Error sending message $e');
      }
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text(
            'Chat ${widget.userName}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            Expanded(
              child: builderMessageList(),
            ),
            messageInput(),
          ]),
        )));
  }

  Widget builderMessageList() {
    return StreamBuilder(
      stream: chatServices.getMessages(
          widget.userName, _firebaseAuth.currentUser!.email.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: kPrimaryColor));
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => messageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget messageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    var alignment =
        (data['senderId'] == _firebaseAuth.currentUser!.email.toString())
            ? Alignment.centerRight
            : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(data['senderId']),
          ChatBubble(message: data['messageText'])
        ],
      ),
    );
  }

  Widget messageInput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _messageController,
          decoration: const InputDecoration(hintText: 'Enter Message'),
          obscureText: false,
        )),
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              color: kPrimaryColor,
            ))
      ],
    );
  }
}
