import 'dart:developer';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/FaceandSkin.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Hair.dart';
import 'package:customer/screens/Homescreen/components/Location.dart';
// import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:customer/screens/SignupLogin/components/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../FreelancerCategoryScreens/Lashes.dart';
import '../FreelancerCategoryScreens/Makeup.dart';
import '../FreelancerCategoryScreens/Nails.dart';
import '../FreelancerCategoryScreens/Spa.dart';
import 'package:line_icons/line_icons.dart';

// int indexhome = 0;
// final screenshome = [
//   FaceandSkinFreelancers(),
//   HairFreelancers(),
//   LashesFreelancers(),
//   MakeupFreelancers(),
//   NailsFreelancers(),
//   SpaFreelancers(),
// ];

class CustHome extends StatefulWidget {
  const CustHome({super.key});

  @override
  State<CustHome> createState() => _CustHomeState();
}

class _CustHomeState extends State<CustHome> {
  // int indexhome = 0;
  final screenshome = [
    HairFreelancers(),
    MakeupFreelancers(),
    SpaFreelancers(),
    NailsFreelancers(),
    LashesFreelancers(),
    FaceandSkinFreelancers(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('putangina filter nih');
                }),
            toolbarHeight: 90,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: TabBar(tabs: [
                Tab(
                  text: 'Hair',
                  icon: SvgPicture.asset(
                    'assets/svg/hair.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
                Tab(
                  text: 'Makeup',
                  icon: SvgPicture.asset(
                    'assets/svg/makeup.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
                Tab(
                  text: 'Body',
                  icon: SvgPicture.asset(
                    'assets/svg/spa.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
                Tab(
                  text: 'Nails',
                  icon: SvgPicture.asset(
                    'assets/svg/nails.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
                Tab(
                  text: 'Lashes',
                  icon: SvgPicture.asset(
                    'assets/svg/hair.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
                Tab(
                  text: 'Wax',
                  icon: SvgPicture.asset(
                    'assets/svg/face & skin.svg',
                    width: 24,
                    height: 24,
                    color: kPrimaryLightColor,
                  ),
                ),
              ]),
            ),
            title: TextField(
              onChanged: (text) {
                //perform ur search here
              },
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print('icon is pressed');
                  },
                ),
              ),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: TabBarView(children: [
            screenshome[0],
            screenshome[1],
            screenshome[2],
            screenshome[3],
            screenshome[4],
            screenshome[5],
          ]),
        ));
  }
}

class ServiceCategories extends StatefulWidget {
  const ServiceCategories({super.key});

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  // int _currentIndex = 0;

  // final List<Widget> _tabs = [
  //   HairFreelancers(),
  // ];

  int indexhome = 0;

  // int indexhome = 0;
  // final screenshome = [
  //   FaceandSkinFreelancers(),
  //   HairFreelancers(),
  //   LashesFreelancers(),
  //   MakeupFreelancers(),
  //   NailsFreelancers(),
  //   SpaFreelancers(),
  // ];

  // Widget _home = screenshome[indexhome];

  // Widget get home {
  //   return screenshome[indexhome];
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child:
            // Column(children: [
            NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: kPrimaryColor,
          labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))
          //u can add text style shits din
          //u can add bg color din
          ),
      child:
          // Column(children: [
          NavigationBar(
              selectedIndex: indexhome,
              onDestinationSelected: (indexhome) =>
                  setState(() => this.indexhome = indexhome),
              backgroundColor: kPrimaryLightColor,
              destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/hair.svg',
                width: 20,
                height: 20,
              ),
              label: 'Hair',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/makeup.svg',
                width: 20,
                height: 20,
              ),
              label: 'Makeup',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/spa.svg',
                width: 20,
                height: 20,
              ),
              label: 'Spa',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/nails.svg',
                width: 20,
                height: 20,
              ),
              label: 'Nails',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/lashes.svg',
                width: 20,
                height: 20,
              ),
              label: 'Lashes',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/face & skin.svg',
                width: 20,
                height: 20,
              ),
              label: 'Face & Skin',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/svg/face & skin.svg',
                width: 20,
                height: 20,
              ),
              label: 'Men',
            ),
          ]),
      // Container(child: screenshome[indexhome])
      // ]),
    )
        // Expanded(child: screenshome[indexhome])
        // ]),
        );
  }
}
