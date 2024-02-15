import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/Homescreen/Homescreen.dart';
// import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:customer/screens/Homescreen/my_profile.dart';
import 'package:flutter/material.dart';

class CustMainScreen extends StatefulWidget {
  const CustMainScreen({super.key});

  @override
  State<CustMainScreen> createState() => _CustMainScreenState();
}

class _CustMainScreenState extends State<CustMainScreen> {
  int index = 0;
  final screens = [CustHome(), Center(child: Text('CHAT YWERDS')), MyProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
