import 'package:customer/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/FaceandSkin.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Hair.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Lashes.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Makeup.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Nails.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Spa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
//   final screenshome = [
//     FaceandSkinFreelancers(),
//     HairFreelancers(),
//     LashesFreelancers(),
//     MakeupFreelancers(),
//     NailsFreelancers(),
//     SpaFreelancers(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: NavigationBarTheme(
//         data: NavigationBarThemeData(
//             indicatorColor: kPrimaryColor,
//             labelTextStyle: MaterialStateProperty.all(
//                 TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
//             //u can add text style shits din
//             //u can add bg color din
//             ),
//         child: NavigationBar(
//             selectedIndex: indexhome,
//             onDestinationSelected: (indexhome) =>
//                 setState(() => this.indexhome = indexhome),
//             backgroundColor: kPrimaryLightColor,
//             destinations: [
//               NavigationDestination(
//                 icon: Icon(
//                   Icons.home_outlined,
//                 ),
//                 label: 'Home',
//                 selectedIcon: Icon(
//                   Icons.home,
//                   color: kLoysPrimaryIconColor,
//                 ),
//               ),
//               NavigationDestination(
//                   icon: Icon(Icons.chat_outlined),
//                   label: 'Chat',
//                   selectedIcon: Icon(
//                     Icons.chat,
//                     color: kLoysPrimaryIconColor,
//                   )),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.person_2_outlined,
//                   ),
//                   label: 'My Profile',
//                   selectedIcon: Icon(
//                     Icons.person_2,
//                     color: kLoysPrimaryIconColor,
//                   )),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.person_2_outlined,
//                   ),
//                   label: 'My Profile',
//                   selectedIcon: Icon(
//                     Icons.person_2,
//                     color: kLoysPrimaryIconColor,
//                   )),
//               NavigationDestination(
//                   icon: Icon(
//                     Icons.person_2_outlined,
//                   ),
//                   label: 'My Profile',
//                   selectedIcon: Icon(
//                     Icons.person_2,
//                     color: kLoysPrimaryIconColor,
//                   )),
//             ]),
//       ),
//       // child: Container(
//       //     width: MediaQuery.of(context).size.width,
//       //     height: 75,
//       //     color: Colors.white,
//       //     child: Expanded(
//       //       child: Row(
//       //         children: [
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/hair.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Hair')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/makeup.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Makeup')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/spa.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Spa')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/nails.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Nails')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/lashes.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Lashes')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //           Expanded(
//       //             child: InkWell(
//       //                 child: Container(
//       //                     child: Column(
//       //                   children: [
//       //                     SvgPicture.asset(
//       //                       'assets/svg/face & skin.svg',
//       //                       height: 40,
//       //                       width: 40,
//       //                     ),
//       //                     Text('Face & Skin')
//       //                   ],
//       //                 )),
//       //                 onTap: () {}),
//       //           ),
//       //         ],
//       //       ),
//       //     )),
//     );
//   }
// }
