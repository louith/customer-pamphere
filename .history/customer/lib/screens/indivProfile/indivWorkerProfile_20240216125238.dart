import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

class IndivWorkerProfile extends StatelessWidget {
  final String userID;

  IndivWorkerProfile({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor, leading: Icon(Icons.arrow_back_ios)),
      body: FutureBuilder(
          future:
              FirebaseFirestore.instance.collection('users').doc(userID).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final workerdata = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${workerdata['name']}'),
                Text('Email: ${workerdata['address']}')
              ],
            );
          }),
      bottomNavigationBar: TabBar(tabs: []),
    );
  }
}
