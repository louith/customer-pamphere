import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          height: 80,
          indicatorColor: kPrimaryColor,
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
          //u can add text style shits din
          //u can add bg color din
          ),
      child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          backgroundColor: kPrimaryLightColor,
          destinations: const [
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
    );
  }
}
