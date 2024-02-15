import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class LashesFreelancers extends StatelessWidget {
  const LashesFreelancers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Lashes'),
    );
  }
}
