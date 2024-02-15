import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentSnapshot, FirebaseFirestore;

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
  Future<MakeupWorkerCard?> getMakeupWorkerCard(String plainID) async {
    final DocumentSnapshot makeup = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Makeup')
        .get();

    if (!makeup.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> makeupMap = makeup.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> makeupSubCats = makeupMap.keys.toList();

    return MakeupWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: makeupSubCats);
  }

  Future<List<MakeupWorkerCard>> getMakeup() async {
    List<Future<MakeupWorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getMakeupWorkerCard(plainID));
    }
    List<MakeupWorkerCard?> makeupWorkersWithNull =
        await Future.wait<WorkerCard?>(futures);
    return hairWorkersWithNull.whereType<WorkerCard>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('makeup'),
    );
  }
}
