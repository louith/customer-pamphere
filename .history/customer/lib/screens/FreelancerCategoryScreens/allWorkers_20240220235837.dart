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
      this.subcategories});
}

class AllWorkers extends StatefulWidget {
  const AllWorkers({super.key});

  @override
  State<AllWorkers> createState() => _AllWorkersState();
}

class _AllWorkersState extends State<AllWorkers> {
  final TextEditingController searchController = TextEditingController();
  late Stream<List<AllWorkerCard?>> _stream;

  Future<AllWorkerCard?> getLashesWorkerCard(String plainID) async {
    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    // Map<String, dynamic> lashesMap = lashes.data() as Map<String, dynamic>;

    //adds subcategories to a list
    // List<String> lashesSubCats = lashesMap.keys.toList();

    return AllWorkerCard(
        id: plainID.toString(),
        name: profileMap['name'],
        address: profileMap['address'],
        // subcategories: lashesSubCats);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
