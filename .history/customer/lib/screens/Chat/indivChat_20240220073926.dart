import 'package:customer/components/constants.dart';
import 'package:customer/screens/indivProfile/indivWorkerProfile.dart';
import 'package:flutter/material.dart';

class IndivChat extends StatefulWidget {
  final WorkerDetailsCard? card;
  const IndivChat({super.key, this.card});

  @override
  State<IndivChat> createState() => _IndivChatState();
}

class _IndivChatState extends State<IndivChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('Chat indiv worker'),
        ),
        body: Text('data'));
    ;
  }
}
