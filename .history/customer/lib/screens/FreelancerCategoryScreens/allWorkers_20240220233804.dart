import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class AllWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;
  final String id;

  AllWorkerCard(
      {required this.id,
      required this.name,
      required this.address,
      required this.subcategories});
}

class AllWorkers extends StatefulWidget {
  const AllWorkers({super.key});

  @override
  State<AllWorkers> createState() => _AllWorkersState();
}

class _AllWorkersState extends State<AllWorkers> {
  final TextEditingController searchController = TextEditingController();
  Stream stream;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
