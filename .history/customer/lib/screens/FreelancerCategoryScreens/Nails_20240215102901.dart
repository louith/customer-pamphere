import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class NailsFreelancers extends StatefulWidget {
  const NailsFreelancers({super.key});

  @override
  State<NailsFreelancers> createState() => _NailsFreelancersState();
}

class _NailsFreelancersState extends State<NailsFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('NAILS'),
    );
  }
}
