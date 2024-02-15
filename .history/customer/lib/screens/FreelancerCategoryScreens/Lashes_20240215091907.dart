import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

class LashesWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  LashesWorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class LashesFreelancers extends StatefulWidget {
  const LashesFreelancers({super.key});

  @override
  State<LashesFreelancers> createState() => _LashesFreelancersState();
}

class _LashesFreelancersState extends State<LashesFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Lashes'),
    );
  }
}
