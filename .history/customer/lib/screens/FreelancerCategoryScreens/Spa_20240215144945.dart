import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class SpaWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  SpaWorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class SpaFreelancers extends StatefulWidget {
  const SpaFreelancers({super.key});

  @override
  State<SpaFreelancers> createState() => _SpaFreelancers();
}

class _SpaFreelancers extends State<SpaFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Spa'),
    );
  }
}
