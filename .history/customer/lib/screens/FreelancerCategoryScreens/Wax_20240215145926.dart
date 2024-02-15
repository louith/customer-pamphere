import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class WaxWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  WorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class WaxWorkers extends StatefulWidget {
  const WaxWorkers({super.key});

  @override
  State<WaxWorkers> createState() => _WaxWorkersState();
}

class _WaxWorkersState extends State<WaxWorkers> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
