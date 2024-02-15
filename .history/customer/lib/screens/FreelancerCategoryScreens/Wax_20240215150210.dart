import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class WaxWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  WaxWorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class WaxWorkers extends StatefulWidget {
  const WaxWorkers({super.key});

  @override
  State<WaxWorkers> createState() => _WaxWorkersState();
}

class _WaxWorkersState extends State<WaxWorkers> {
  Future<WaxWorkerCard?> getWorkerCard(String plainID) async {
    final DocumentSnapshot wax = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Wax')
        .get();

    if (!wax.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> waxMap = wax.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> waxSubCats = waxMap.keys.toList();

    return WaxWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: waxSubCats);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
