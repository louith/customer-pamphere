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
  Future<SpaWorkerCard?> getSpaWorkerCard(String plainID) async {
    final DocumentSnapshot hairs = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Hair')
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

    return SpaWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: hairSubCats);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Spa'),
    );
  }
}
