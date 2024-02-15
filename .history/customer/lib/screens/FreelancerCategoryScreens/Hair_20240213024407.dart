import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
//document IDs based off selected query

//Strings to assign to text widgets (fieldnames)
//freelancers & salons
class WorkerCard {
  final String name;
  final String address;
  final List<String> subcategories;

  WorkerCard(
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
  // late List<WorkerCard> workerList = []; //list of worker objects
  // final controller = StreamController<List<dynamic>>()

  @override
  void initState() {
    super.initState();
    getPlainDocIds();
    getHairs();
    // tryHairs();
  }

  Future<List<WorkerCard>> getHairs() async {
    List<WorkerCard> hairWorkers = [];
    for (var plainID in plaindocIds) {
      //kuhaon hair document
      final DocumentSnapshot hairs = await db
          .collection('users')
          .doc(plainID)
          .collection('categories')
          .doc('Hair')
          .get();

      if (!hairs.exists) {
        continue;
      }

      final DocumentSnapshot profile =
          await db.collection('users').doc(plainID).get();

      Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

      //gets hair subcollection document
      Map<String, dynamic> hairsMap = hairs.data() as Map<String, dynamic>;

      //adds subcategories to a list
      List<String> hairSubCats = hairsMap.keys.toList();

      hairWorkers.add(WorkerCard(
          name: profileMap['name'],
          address: profileMap['address'],
          subcategories: hairSubCats));

      // try {
      //   //converts  the document to map
      //

      //   if (hairs.exists) {
      //     // print('Hairs exist');

      //     //for listview builder number of cards
      //     hairList.add(plainID);

      //     final DocumentSnapshot profile =
      //         await db.collection('users').doc(plainID).get();

      //

      //     print(profileMap);

      //     //add map content of profiles to a list for me to iterate later
      //     hairList.add(profileMap);

      //     // Convert documents to Product objects
      //     List<WorkerCard> hairProfileList = hairList.map((content) {
      //       // Fetch nested document 'details' and extract 'description' field
      //       var hair = content['categories']['Hair'];
      //       return WorkerCard(
      //         name: content['name'],
      //         address: content['address'],
      //         subcategories: hair,
      //       );
      //     }).toList();

      //     // setState(() {
      //     //   workerList = hairProfileList;
      //     // });

      //     return hairProfileList;
      //   } else {
      //     print('NO HAIRS =_=');
      //   }
      // } catch (e) {
      //   throw Exception(e);
      // }
    }
    return hairWorkers;
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
                // return ListTile(
                //   title: Text(hairWorkers[index].name),
                //   subtitle: Text(hairWorkers[index].address),
                // );

                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //boxshadow code/styling
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/suzy.jpg',
                      width: 50,
                      height: 50,
                    ),
                    title: Text(hairWorkers[index].name),
                    subtitle: Text(hairWorkers[index].address),
                  ),
                );
              });
        }
      },
    );
  }
}

// class SubCategoriesRow extends StatelessWidget {
//   const SubCategoriesRow({super.key, required this.itemList});

//   final List<dynamic> itemList;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         itemList.length,
//         (index) => Container(
//           padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
//           decoration: BoxDecoration(
//               color: Colors.purple[100],
//               borderRadius: BorderRadius.circular(100)),
//           child: Text(itemList[index]),
//         ),
//       ),
//     );
//   }
// }
