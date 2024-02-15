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
  State<CustHome> createState() => _CustHomeState2();
}

class _CustHomeState2 extends State<CustHome> {
  Widget currentScreen = HairFreelancers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                print('putangina filter nih');
              }),
          toolbarHeight: 90,
          title: TextField(
            onChanged: (text) {
              //perform ur search here
            },
            decoration: InputDecoration(
              hintText: 'Search',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print('icon is pressed');
                },
              ),
            ),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Column(children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: InkWell(onTap: () => {
                    
                  },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Center(
                              child: Column(
                            children: [Icon(Icons.favorite), Text("Hair")],
                          ))))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: Column(
                        children: [Icon(Icons.favorite), Text("makeup")],
                      )))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: Column(
                        children: [Icon(Icons.favorite), Text("body")],
                      )))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: Column(
                        children: [Icon(Icons.favorite), Text("nails")],
                      )))),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: Column(
                        children: [Icon(Icons.favorite), Text("lashes")],
                      )))),
              Expanded(
                  child: Container(H
                      padding: EdgeInsets.all(5),
                      child: Center(
                          child: Column(
                        children: [Icon(Icons.favorite), Text("Wax")],
                      )))),
            ],
          ),
          Expanded(child: currentScreen)
        ]));
  }
}

class _CustHomeState extends State<CustHome> {
  Widget currentScreen = HairFreelancers();
  // int indexhome = 0;
  final screenshome = [
    const HairFreelancers(),
    const MakeupFreelancers(),
    const SpaFreelancers(),
    const NailsFreelancers(),
    const LashesFreelancers(),
    const FaceandSkinFreelancers(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  print('putangina filter nih');
                }),
            toolbarHeight: 90,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
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
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('icon is pressed');
                  },
                ),
              ),
            ),
            backgroundColor: kPrimaryColor,
          ),
          body: TabBarView(
              // controller: TabController(
              //   length: 6,
              // ),
              children: [
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
