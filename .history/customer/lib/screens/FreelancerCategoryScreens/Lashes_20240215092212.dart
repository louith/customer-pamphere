import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
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
  Future<LashesWorkerCard?> getLashesWorkerCard(String plainID) async {
    final DocumentSnapshot lashes = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Lashes')
        .get();

    if (!lashes.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> lashesMap = lashes.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> lashesSubCats = lashesMap.keys.toList();

    return LashesWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: lashesSubCats);
  }

  Future<List<LashesWorkerCard>> getHairs() async {
    List<Future<LashesWorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getLashesWorkerCard(plainID));
    }
    List<LashesWorkerCard?> hairWorkersWithNull =
        await Future.wait<LashesWorkerCard?>(futures);
    return hairWorkersWithNull.whereType<LashesWorkerCard>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Lashes'),
    );
  }
}
