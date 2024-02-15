import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;

final db = FirebaseFirestore.instance;

class WorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  WorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class MakeupFreelancers extends StatefulWidget {
  const MakeupFreelancers({super.key});

  @override
  State<MakeupFreelancers> createState() => _MakeupFreelancersState();
}

class _MakeupFreelancersState extends State<MakeupFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('makeup'),
    );
  }
}
