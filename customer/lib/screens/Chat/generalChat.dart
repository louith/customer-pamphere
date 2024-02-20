import 'package:flutter/material.dart';

class GeneralChatPage extends StatefulWidget {
  const GeneralChatPage({super.key});

  @override
  State<GeneralChatPage> createState() => _GeneralChatPageState();
}

class _GeneralChatPageState extends State<GeneralChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Chat Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Text(
          'displays here each worker na na chattan sa customer home screen messenger alike'),
    );
  }
}
