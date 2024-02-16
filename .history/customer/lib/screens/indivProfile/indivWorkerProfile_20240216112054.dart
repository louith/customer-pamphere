import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

class IndivWorkerProfile extends StatefulWidget {
  final String userID;

  IndivWorkerProfile({super.key, required this.userID});

  @override
  State<IndivWorkerProfile> createState() => _IndivWorkerProfileState();
}

class _IndivWorkerProfileState extends State<IndivWorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: Icon(Icons.arrow_back_ios)),
        body: Text('ahshs'));
  }
}
