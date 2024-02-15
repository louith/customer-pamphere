import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
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
    final DocumentSnapshot spa = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Spa')
        .get();

    if (!spa.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> spaMap = spa.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> spaSubCats = spaMap.keys.toList();

    return SpaWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: spaSubCats);
  }

  Future<List<SpaWorkerCard>> getSpa() async {
    List<Future<SpaWorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getSpaWorkerCard(plainID));
    }
    List<SpaWorkerCard?> hairWorkersWithNull =
        await Future.wait<SpaWorkerCard?>(futures);
    return hairWorkersWithNull.whereType<SpaWorkerCard>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Spa'),
    );
  }
}
