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

  //Strings to assign to text widgets (fieldnames)
  // String docID =

  String fnameVal = "";
  String lnameVal = '';
  String categoryVal = '';
  String cityVal = '';
  String streetVal = '';
  String fullname = " ";

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
  Future<void> getPlainDocIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        // .where('role', whereIn: ['freelancer', 'salon'])
        .where('role', isEqualTo: 'freelancer')
        .where("status", isEqualTo: "verified")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              // print(element.reference);
              print(element.reference.id);
              plaindocIds.add(element.reference.id.toString());
            }));
  }

  Future<void> getHairs() async {
    for (String plainID in plaindocIds) {
      try {
        DocumentSnapshot hairsCheck = await FirebaseFirestore.instance
            .collection('users')
            .doc(plainID)
            .collection('userDetails')
            .doc('step2')
            .get();

        Map<String, dynamic> hairsCheckMap =
            hairsCheck.data() as Map<String, dynamic>;
        if (hairsCheckMap.containsKey('nails')) {
          DocumentSnapshot step1 = await FirebaseFirestore.instance
              .collection('users')
              .doc(plainID)
              .collection('userDetails')
              .doc('step1')
              .get();

          Map<String, dynamic> step1Map = step1.data() as Map<String, dynamic>;

          setState(() {
            fnameVal = step1Map['firstName'];
            lnameVal = step1Map['lastName'];
            fullname = fnameVal + lnameVal;
            cityVal = step1Map['streetAddress'];
            streetVal = step1Map['city'];
          });
          print(step1Map.entries);
        } else {
          print('hala walay hair');
        }
      } catch (e) {
        print('Error fetching user details: $e');
      }
    }
  }

  @override
  void initState() {
    // print(plainVerified_doc);
    getPlainDocIds();
    getHairs();
    // print(subs.toString());
    // plaindocIds.forEach((id) => print(id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // ElevatedButton(onPressed: getHairs, child: const Text('try query')),
          Text('First name: $fnameVal'),

          Expanded(
              child: FutureBuilder(
                  future: getPlainDocIds(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('hair'),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
