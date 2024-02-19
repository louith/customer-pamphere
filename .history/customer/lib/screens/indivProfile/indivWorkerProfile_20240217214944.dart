import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/Booking/bookingScreen.dart';
import 'package:customer/screens/Chat/indivChat.dart';
import 'package:customer/screens/ServicesOffered/servicesList.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class WorkerDetailsCard {
  final String id;
  final String name;
  // final String stars;
  // final String feedbacks;

  final String role;
  final String address;
  final List<String> categories;
  final String? worksAt;

  WorkerDetailsCard({
    required this.id,
    required this.name,
    required this.role,
    required this.address,
    required this.categories,
    this.worksAt,
  });
}

class IndivWorkerProfile extends StatelessWidget {
  final String userID;
  // int index = 0;
  final screens = [ServicesList(), IndivChat(), BookingScreen()];

  IndivWorkerProfile({super.key, required this.userID});
  Future<WorkerDetailsCard> getWorkerDetailsCard() async {
    // id = userID;
    //gets user document first layer
    final DocumentSnapshot user =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    Map<String, dynamic> userMap = user.data() as Map<String, dynamic>;

    //gets categories offered by worker
    List<String> cats = [];
    var snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('categories')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              cats.add(element.id.toString());
            }));

    return WorkerDetailsCard(
        id: userID,
        name: userMap['name'],
        role: userMap['role'],
        address: userMap['address'],
        categories: cats);
  }

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
            // future: FirebaseFirestore.instance
            //     .collection('users')
            //     .doc(userID)
            //     .get(),
            future: getWorkerDetailsCard(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return Text('No data available');
              }

              final plainWorkerdata = snapshot.data!;

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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Name: ${plainWorkerdata['name']}'),
                            Text('Address: ${plainWorkerdata['address']}')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Feedbacks section below')
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
