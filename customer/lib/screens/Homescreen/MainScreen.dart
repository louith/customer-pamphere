import 'package:customer/constants.dart';
import 'package:customer/screens/Homescreen/Homescreen.dart';
import 'package:flutter/material.dart';

class CustMainScreen extends StatefulWidget {
  const CustMainScreen({super.key});

  @override
  State<CustMainScreen> createState() => _CustMainScreenState();
}

class _CustMainScreenState extends State<CustMainScreen> {
  int index = 0;
  final screens = [
    CustHome(),
    Center(child: Text('chat')),
    Center(
      child: (Text('MY PROFILE BITCH')),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: kPrimaryColor,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
            //u can add text style shits din
            //u can add bg color din
            ),
        child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            backgroundColor: kPrimaryLightColor,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home,
                  color: kLoysPrimaryIconColor,
                ),
              ),
              NavigationDestination(
                  icon: Icon(Icons.chat_outlined),
                  label: 'Chat',
                  selectedIcon: Icon(
                    Icons.chat,
                    color: kLoysPrimaryIconColor,
                  )),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_2_outlined,
                  ),
                  label: 'My Profile',
                  selectedIcon: Icon(
                    Icons.person_2,
                    color: kLoysPrimaryIconColor,
                  )),
            ]),
      ),
    );
  }
}
