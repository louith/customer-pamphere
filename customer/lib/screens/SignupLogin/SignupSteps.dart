import 'package:customer/screens/SignupLogin/components/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CustPersonalInfo extends StatefulWidget {
  const CustPersonalInfo({super.key});

  @override
  State<CustPersonalInfo> createState() => _CustPersonalInfoState();
}

class _CustPersonalInfoState extends State<CustPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Column(
        children: [
          ImgSubmission(),
        ],
      )),
    );
  }
}
