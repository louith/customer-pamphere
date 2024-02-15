import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;

final db = FirebaseFirestore.instance;

class MakeupWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  MakeupWorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class MakeupFreelancers extends StatefulWidget {
  const MakeupFreelancers({super.key});

  @override
  State<MakeupFreelancers> createState() => _MakeupFreelancersState();
}

class _MakeupFreelancersState extends State<MakeupFreelancers> {
  Future<MakeupWorkerCard?> getWorkerCard(String plainID) async {
    final DocumentSnapshot makeup = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Makeup')
        .get();

    if (!hairs.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> hairsMap = hairs.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> hairSubCats = hairsMap.keys.toList();

    return WorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: hairSubCats);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('makeup'),
    );
  }
}
