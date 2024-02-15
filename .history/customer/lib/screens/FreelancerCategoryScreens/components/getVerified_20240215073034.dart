import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// List<String> plaindocIds = [];

// gets those docs that matches the query & conditionals
Future<List<String>> getPlainDocIds() async {
  List<String> plaindocIds = [];
  await FirebaseFirestore.instance
      .collection('users')
      
      .where('role', whereIn: ['freelancer', 'salon'])
      // .where('role', isEqualTo: 'freelancer')
      .where("status", isEqualTo: "verified")
      .get()
      .then((snapshot) => snapshot.docs.forEach((element) {
            // print(element.reference);
            // print(element.reference.id);
            plaindocIds.add(element.reference.id.toString());
          }));
  return plaindocIds;
}


// //freelancers
// String fnameVal = "";
// String lnameVal = '';
// String categoryVal = '';
// String faddress = '';
// // String cityVal = '';
// // String streetVal = '';
// String fullname = "";

// //salons
// String salonName = '';
// String salonAddress = '';

// //gets verified freelancers
// void getFreelancerPlainDocIds() async {
//   await db
//       .collection('users')
//       .where('role', isEqualTo: 'freelancer')
//       // .where('role', isEqualTo: 'freelancer')
//       .where("status", isEqualTo: "verified")
//       .get()
//       .then((snapshot) => snapshot.docs.forEach((element) {
//             // print(element.reference);
//             print(element.reference.id);
//             freelancerPlaindocIds.add(element.reference.id.toString());
//           }));
// }

// void getSalonPlainDocIds() async {
//   await db
//       .collection('users')
//       .where('role', isEqualTo: 'salon')
//       .where("status", isEqualTo: "verified")
//       .get()
//       .then((snapshot) => snapshot.docs.forEach((element) {
//             // print(element.reference);
//             print(element.reference.id);
//             salonPlaindocIds.add(element.reference.id.toString());
//           }));
// }

// void getFreelancerInfo() async {
//   for (String fPlainID in freelancerPlaindocIds) {
//     try {
//       DocumentSnapshot freelancerInfo =
//           await db.collection('users').doc(fPlainID).get();

//       Map<String, dynamic> fInfomap =
//           freelancerInfo.data() as Map<String, dynamic>;

//       fullname = fInfomap['name'];
//       // .doc(plainID)
//     } catch (e) {}
//   }
// }

// void getSalonInfo() async {
//   for (String fPlainID in freelancerPlaindocIds) {
//     try {
//       DocumentSnapshot salonInfo =
//           await db.collection('users').doc(fPlainID).get();

//       Map<String, dynamic> sInfomap = salonInfo.data() as Map<String, dynamic>;

//       salonAddress = sInfomap['address'];
//       salonName = sInfomap['salonName'];

//       // .doc(plainID)
//     } catch (e) {}
//   }
// }


//getHairs data to display hairs na page
// void getHairs() async {
//   for (String plainID in plaindocIds) {
//     try {
//       DocumentSnapshot hair = await db
//           .collection('users')
//           .doc(plainID)
//           .collection('categories')
//           .doc('Hair')
//           .get();

//       if (hair.exists) {
//         Map<String, dynamic> hairsMap = hair.data() as Map<String, dynamic>;
//         List<String> hairFields = hairsMap.keys.toList();
//         print('Field names: $hairFields');
//       } else {
//         print('Hair service does not exist.');
//       }
//     } catch (e) {
//       print('Error fetching user details: $e');
//     }
//   }
// }
