import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/Booking/bookingScreen.dart';
import 'package:customer/screens/Chat/indivChat.dart';
import 'package:customer/screens/ServicesOffered/servicesList.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class IndivWorkerProfile extends StatelessWidget {
  final String userID;
  // int index = 0;
  final screens = [ServicesList(), IndivChat(), BookingScreen()];

  IndivWorkerProfile({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios))),
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(userID)
                .get(),
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
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/suzy.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Name: ${workerdata['name']}'),
                      Text('Address: ${workerdata['address']}')
                    ],
                  ),
                ],
              );
            }),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              height: 80,
              indicatorColor: kPrimaryColor,
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              // selectedIndex: index,
              onDestinationSelected: (index) {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => screens[index])));
              },
              destinations: const [
                NavigationDestination(
                    icon: LineIcon.servicestack(),
                    label: 'Services',
                    selectedIcon:
                        LineIcon.servicestack(color: kLoysPrimaryIconColor)),
                NavigationDestination(
                    icon: Icon(Icons.chat_outlined),
                    label: 'Chat Now',
                    selectedIcon:
                        Icon(Icons.chat, color: kLoysPrimaryIconColor)),
                NavigationDestination(
                    icon: LineIcon.calendarPlus(),
                    label: 'Book Now',
                    selectedIcon:
                        LineIcon.calendarPlusAlt(color: kLoysPrimaryIconColor)),
              ]),
        ));
  }
}
