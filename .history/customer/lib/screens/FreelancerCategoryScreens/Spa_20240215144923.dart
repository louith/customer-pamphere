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

class SpaFreelancers extends StatefulWidget {
  const SpaFreelancers({super.key});

  @override
  State<SpaFreelancers> createState() => _SpaFreelancers();
}

class _SpaFreelancers extends State<SpaFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Spa'),
    );
  }
}
