import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class AllWorkerCard {
  final String name;
  final String address;
  final List<String>? categories;
  final String id;

  AllWorkerCard(
      {required this.id,
      required this.name,
      required this.address,
      this.categories});
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

    final QuerySnapshot<Map<String, dynamic>> subcategory = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .get();
    //gets hair subcollection document
    // Map<String, dynamic> lashesMap = lashes.data() as Map<String, dynamic>;

    //adds subcategories to a list
    // List<String> lashesSubCats = lashesMap.keys.toList();
    final subcatDocs = subcategory.docs.map((doc) => doc.id).toList();
    return AllWorkerCard(
        id: plainID.toString(),
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: subcatDocs);
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(itemBuilder: (context, index) {});
          }
        });
  }
}
