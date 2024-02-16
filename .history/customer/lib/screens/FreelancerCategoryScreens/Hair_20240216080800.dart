import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:customer/screens/indivProfile/indivWorkerProfile.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class WorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;
  final id;

  WorkerCard(this.id,
      {required this.name, required this.address, required this.subcategories});
}

// List<dynamic> hairSubCats = [];
// List<dynamic> hairList = [];

class HairFreelancers extends StatefulWidget {
  const HairFreelancers({super.key});

  @override
  State<HairFreelancers> createState() => _HairFreelancersState();
}

class _HairFreelancersState extends State<HairFreelancers> {
  Future<WorkerCard?> getWorkerCard(String plainID) async {
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

    return WorkerCard(
        name: profileMap['name'],
        address: profileMap['address'],
        subcategories: hairSubCats);
  }

  Future<List<WorkerCard>> getHairs() async {
    List<Future<WorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getWorkerCard(plainID));
    }
    List<WorkerCard?> hairWorkersWithNull =
        await Future.wait<WorkerCard?>(futures);
    return hairWorkersWithNull.whereType<WorkerCard>().toList();
  }

  @override
  void initState() {
    super.initState();
    // getPlainDocIds();
    // getHairs();
    // tryHairs();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WorkerCard>>(
      stream: Stream.fromFuture(getHairs()), // Convert the Future to a Stream
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('loading');
        } else {
          List<WorkerCard> hairWorkers = snapshot.data!;
          return ListView.builder(
              itemCount: hairWorkers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    //boxshadow code/styling
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/suzy.jpg',
                      width: 50,
                      height: 50,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hairWorkers[index].name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SubCategoriesRow(
                            itemList: hairWorkers[index].subcategories),
                        Text(hairWorkers[index].address,
                            style: const TextStyle(fontWeight: FontWeight.w300))
                      ],
                    ),
                    shape: RoundedRectangleBorder(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IndivWorkerProfile()),
                      );
                    },
                  ),
                );
              });
        }
      },
    );
  }
}

class SubCategoriesRow extends StatelessWidget {
  const SubCategoriesRow({super.key, required this.itemList});

  final List<dynamic> itemList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          itemList.length,
          (index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(100)),
            child: Text(itemList[index]),
          ),
        ),
      ),
    );
  }
}
