import 'package:customer/components/bottomNav.dart';
import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndivWorkerProfile extends StatefulWidget {
  const IndivWorkerProfile({super.key});

  @override
  State<IndivWorkerProfile> createState() => _IndivWorkerProfileState();
}

class _IndivWorkerProfileState extends State<IndivWorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed: () {
      //         print('putangina filter nih');
      //       }),
      //   toolbarHeight: 90,
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(48),
      //     child: TabBar(tabs: [
      //       Tab(
      //         text: 'Hair',
      //         icon: SvgPicture.asset(
      //           'assets/svg/hair.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //       Tab(
      //         text: 'Makeup',
      //         icon: SvgPicture.asset(
      //           'assets/svg/makeup.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //       Tab(
      //         text: 'Body',
      //         icon: SvgPicture.asset(
      //           'assets/svg/spa.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //       Tab(
      //         text: 'Nails',
      //         icon: SvgPicture.asset(
      //           'assets/svg/nails.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //       Tab(
      //         text: 'Lashes',
      //         icon: SvgPicture.asset(
      //           'assets/svg/hair.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //       Tab(
      //         text: 'Wax',
      //         icon: SvgPicture.asset(
      //           'assets/svg/face & skin.svg',
      //           width: 24,
      //           height: 24,
      //           color: kPrimaryLightColor,
      //         ),
      //       ),
      //     ]),
      //   ),
      //   title: TextField(
      //     onChanged: (text) {
      //       //perform ur search here
      //     },
      //     decoration: InputDecoration(
      //       hintText: 'Search',
      //       border: const OutlineInputBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
      //       ),
      //       prefixIcon: IconButton(
      //         icon: const Icon(Icons.search),
      //         onPressed: () {
      //           print('icon is pressed');
      //         },
      //       ),
      //     ),
      //   ),
      //   backgroundColor: kPrimaryColor,
      // ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        child: const Row(children: [
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
        ]),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
