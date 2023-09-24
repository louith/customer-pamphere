import 'package:flutter/material.dart';

class FaceandSkinFreelancers extends StatefulWidget {
  const FaceandSkinFreelancers({super.key});

  @override
  State<FaceandSkinFreelancers> createState() => _FaceandSkinFreelancers();
}

class _FaceandSkinFreelancers extends State<FaceandSkinFreelancers> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: ListTile(
        leading: Icon(Icons.person_2),
        title: Text('Jung Wheein'),
        subtitle: Text('Agdao'),
      ),
    ));
  }
}
