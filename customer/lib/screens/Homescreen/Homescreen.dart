import 'dart:developer';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/FaceandSkin.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Hair.dart';
import 'package:customer/screens/Homescreen/components/Location.dart';
import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:customer/screens/SignupLogin/components/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../FreelancerCategoryScreens/Lashes.dart';
import '../FreelancerCategoryScreens/Makeup.dart';
import '../FreelancerCategoryScreens/Nails.dart';
import '../FreelancerCategoryScreens/Spa.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 160,
          backgroundColor: Colors.white,
          foregroundColor: kPrimaryColor,
          title: PreferredSize(
              preferredSize: Size.fromHeight(110), child: LocationHome()),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(25),
          //   bottomRight: Radius.circular(25),
          // )),
        ),
        body: Text('hsdhd')
        // Column(children: <Widget>[
        //   Container(child: ServiceCategories()),
        //   Expanded(child: screenshome[indexhome])
        // ]),
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

//TOP NAV BAR
// class ServiceCategories extends StatefulWidget {
//   const ServiceCategories({super.key});

//   @override
//   State<ServiceCategories> createState() => _ServiceCategoriesState();
// }

// class _ServiceCategoriesState extends State<ServiceCategories> {
//   // int _currentIndex = 0;

//   // final List<Widget> _tabs = [
//   //   HairFreelancers(),
//   // ];

//   int indexhome = 0;
//   // final screenshome = [
//   //   FaceandSkinFreelancers(),
//   //   HairFreelancers(),
//   //   LashesFreelancers(),
//   //   MakeupFreelancers(),
//   //   NailsFreelancers(),
//   //   SpaFreelancers(),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: NavigationBarTheme(
//         data: NavigationBarThemeData(
//             indicatorColor: kPrimaryColor,
//             labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))
//             //u can add text style shits din
//             //u can add bg color din
//             ),
//         child: Column(children: [
//           NavigationBar(
//               selectedIndex: indexhome,
//               onDestinationSelected: (indexhome) =>
//                   setState(() => this.indexhome = indexhome),
//               backgroundColor: kPrimaryLightColor,
//               destinations: [
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/hair.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Hair',
//                 ),
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/makeup.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Makeup',
//                 ),
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/spa.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Spa',
//                 ),
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/nails.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Nails',
//                 ),
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/lashes.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Lashes',
//                 ),
//                 NavigationDestination(
//                   icon: SvgPicture.asset(
//                     'assets/svg/face & skin.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   label: 'Face & Skin',
//                 ),
//               ]),
//           // Container(child: screenshome[indexhome])
//         ]),
//       ),
//     );
//   }
// }
