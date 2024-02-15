import 'package:flutter/material.dart';

class IndivWorkerProfile extends StatefulWidget {
  const IndivWorkerProfile({super.key});

  @override
  State<IndivWorkerProfile> createState() => _IndivWorkerProfileState();
}

class _IndivWorkerProfileState extends State<IndivWorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('john.doe@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('New York, USA'),
            ),
          ],
        ),
      ),
    );
  }
}
