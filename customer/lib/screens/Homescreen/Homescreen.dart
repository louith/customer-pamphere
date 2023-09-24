import 'package:customer/constants.dart';
import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:flutter/material.dart';

class CustHome extends StatefulWidget {
  const CustHome({super.key});

  @override
  State<CustHome> createState() => _CustHomeState();
}

class _CustHomeState extends State<CustHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Bajada, Davao City'),
            Text('#789, Venus St., Victoria Heights, Damosa,  Davao')
          ],
        ),
        // title: Text('Address placeholder'),

        // bottom: PreferredSize(
        //     preferredSize: Size.zero,
        //     child: Text(
        //         '#504 Neptune Street, Margarita Village, Bajada, Davao City')),
        leading: Icon(Icons.pin_drop),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        color: Colors.white,
        child: ServiceCategories(),
        // child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: 150,
        //     color: kPrimaryColor,
        //     child: Row(
        //       children: [
        //         Material(
        //             child: ListTile(
        //           leading: Icon(Icons.question_mark),
        //           title: Text('Hair'),
        //           hoverColor: Color.fromARGB(70, 111, 53, 165),
        //           onTap: () {
        //             // Add functionality for Item 2 here
        //           },
        //         ))
        //       ],
        //     )
        //     ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: 0, onTap: (int index) {}, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ]),
    );
  }
}
