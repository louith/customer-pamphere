import 'dart:developer';
import 'package:customer/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/FaceandSkin.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Hair.dart';
import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:customer/screens/SignupLogin/components/ImagePicker.dart';
import 'package:flutter/material.dart';

import '../FreelancerCategoryScreens/Lashes.dart';
import '../FreelancerCategoryScreens/Makeup.dart';
import '../FreelancerCategoryScreens/Nails.dart';
import '../FreelancerCategoryScreens/Spa.dart';

class CustHome extends StatefulWidget {
  const CustHome({super.key});

  @override
  State<CustHome> createState() => _CustHomeState();
}

class _CustHomeState extends State<CustHome> {
  int indexhome = 0;
  final screenshome = [
    FaceandSkinFreelancers(),
    HairFreelancers(),
    LashesFreelancers(),
    MakeupFreelancers(),
    NailsFreelancers(),
    SpaFreelancers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Column(
            children: [
              Row(children: [
                Icon(Icons.pin_drop),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bajada, Davao City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '#789, Venus St., Victoria Heights, Damosa,  Davao',
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ]),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //       showSearch(
                  //         context: context,
                  //         delegate: CustomSearchDelegate(),
                  //       );
                  //     },
                  //     icon: Icon(Icons.search))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: MediaQuery.of(context).size.height - 88,
          width: MediaQuery.of(context).size.width,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
                indicatorColor: kPrimaryColor,
                labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                //u can add text style shits din
                //u can add bg color din
                ),
            child: Column(children: [
              NavigationBar(
                  selectedIndex: indexhome,
                  onDestinationSelected: (indexhome) =>
                      setState(() => this.indexhome = indexhome),
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
                    NavigationDestination(
                        icon: Icon(
                          Icons.person_2_outlined,
                        ),
                        label: 'My Profile',
                        selectedIcon: Icon(
                          Icons.person_2,
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
              Container(child: screenshome[indexhome])
            ]),
          ),
        ),
        // Expanded(child: Container(child: screenshome[indexhome]))
      ]),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = [
//     'Apple',
//     'Banana',
//     'Pear',
//     'Watermelons',
//     'Oranges'
//   ];
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   // @override
//   // Widget buildResults(BuildContext context) {}

//   // @override
//   // Widget buildSuggestions(BuildContext context) {}
// }

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
  final screenshome = [
    FaceandSkinFreelancers(),
    HairFreelancers(),
    LashesFreelancers(),
    MakeupFreelancers(),
    NailsFreelancers(),
    SpaFreelancers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: kPrimaryColor,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
            //u can add text style shits din
            //u can add bg color din
            ),
        child: NavigationBar(
            selectedIndex: indexhome,
            onDestinationSelected: (indexhome) =>
                setState(() => this.indexhome = indexhome),
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
              NavigationDestination(
                  icon: Icon(
                    Icons.person_2_outlined,
                  ),
                  label: 'My Profile',
                  selectedIcon: Icon(
                    Icons.person_2,
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
