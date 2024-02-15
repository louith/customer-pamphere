import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class NailsWorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  NailsWorkerCard(
      {required this.name, required this.address, required this.subcategories});
}

class NailsFreelancers extends StatefulWidget {
  const NailsFreelancers({super.key});

  @override
  State<NailsFreelancers> createState() => _NailsFreelancersState();
}

class _NailsFreelancersState extends State<NailsFreelancers> {
  Future<NailsWorkerCard?> getNailsWorkerCard(String plainID) async {
    final DocumentSnapshot nails = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .doc('Nails')
        .get();

    if (!nails.exists) {
      return null;
    }

    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    //gets hair subcollection document
    Map<String, dynamic> nailsMap = nails.data() as Map<String, dynamic>;

    //adds subcategories to a list
    List<String> nailSubCats = nailsMap.keys.toList();

    return NailsWorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: nailSubCats);
  }

  Future<List<NailsWorkerCard>> getHairs() async {
    List<Future<NailsWorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getNailsWorkerCard(plainID));
    }
    List<NailsWorkerCard?> hairWorkersWithNull =
        await Future.wait<NailsWorkerCard?>(futures);
    return hairWorkersWithNull.whereType<NailsWorkerCard>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('NAILS'),
    );
  }
}
