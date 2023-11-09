import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

var workersdb = FirebaseFirestore.instance.collection('users');

class FaceandSkinFreelancers extends StatefulWidget {
  const FaceandSkinFreelancers({super.key});

  @override
  State<FaceandSkinFreelancers> createState() => _FaceandSkinFreelancers();
}

class _FaceandSkinFreelancers extends State<FaceandSkinFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Card(
            child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/wheeinie.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Text("Jung Wheein"),
                Container(
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print('i am clicked');
                          },
                          child: Text('Gluta Drip')),
                    ],
                  ),
                ),
                Container(
                  child: Row(children: [
                    Icon(Icons.pin_drop),
                    Text('Agdao, Davao City')
                  ]),
                ),
                Container(
                  child: Row(
                    children: [Text('15'), Text('feedbacks')],
                  ),
                )
              ],
            ),
            Container(
              child: Row(children: [Text('4'), Icon(Icons.star)]),
            )
          ],
        ))
      ],
    ));
  }
}
