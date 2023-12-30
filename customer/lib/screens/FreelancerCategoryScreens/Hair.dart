import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HairFreelancers extends StatefulWidget {
  const HairFreelancers({super.key});

  @override
  State<HairFreelancers> createState() => _HairFreelancersState();
}

class _HairFreelancersState extends State<HairFreelancers> {
  final db = FirebaseFirestore.instance;
  //document IDs based off selected query

  var hairs = {};
  List hairdocs = [];
  List<dynamic> plaindocIds = [];

  // //list of filtered docs
  // final Future<QuerySnapshot<Map<String, dynamic>>> plainVerified_doc =
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .where('role', whereIn: ['freelancer', 'salon'])
  //         .where("status", isEqualTo: "verified")
  //         .get();

  //gets those docs that matches the query & conditionals
  Future getPlainDocIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('role', whereIn: ['freelancer', 'salon'])
        .where("status", isEqualTo: "verified")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              // print(element.reference);
              // print(element.data());
              plaindocIds.add(element.reference.id);
            }));
  }

  // Future<QuerySnapshot> getSubCol() {}

  // Future getSubcolHairs(String docID) async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(docID)
  //       .collection('userDetails')
  //       .get();

  //   querySnapshot.docs.forEach((doc) {
  //     print(doc.data());
  //   });
  // }

  Future getSubcolHairs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('role', whereIn: ['freelancer', 'salon'])
        .where("status", isEqualTo: "verified")
        .get()
        .then((value) {
          value.docs.forEach((result) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(result.id)
                .collection('userDetails')
                .get()
                .then((subcol) {
              subcol.docs.forEach((element) {
                //element = whole doc
                hairdocs.add(element.data());
                // print(element.data());
              });
            });
          });
        });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> verified = FirebaseFirestore
      .instance
      .collection('users')
      .where('role', whereIn: ['freelancer', 'salon'])
      .where("status", isEqualTo: "verified")
      .get();

  // final subs = FirebaseFirestore.instance
  //     .collection('users')
  //     .where('role', whereIn: ['freelancer', 'salon'])
  //     .where("status", isEqualTo: "verified")
  //     .get()
  //     .then((value) {
  //       value.docs.forEach((result) {
  //         FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(result.id)
  //             .collection('userDetails')
  //             .get()
  //             .then((subcol) {
  //           subcol.docs.forEach((element) {
  //             // print(element.data());
  //             // hairdocs.add(element.data());
  //             // print(hairdocs.length);
  //           });
  //         });
  //       });
  //     });

  @override
  void initState() {
    // getSubcolHairs();
    // print(plainVerified_doc);
    // getPlainDocIds();
    // print(subs.toString());
    plaindocIds.forEach((id) => print(id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('hshdhd')
          // Expanded(
          //     child: FutureBuilder(
          //         future: getPlainDocIds(),
          //         builder: (context, snapshot) {
          //           return ListView.builder(
          //               itemCount: 2,
          //               itemBuilder: (context, index) {
          //                 return ListTile(
          //                   title: Text('hair'),
          //                 );
          //               });
          //         }))
        ],
      ),
    );
  }
}
