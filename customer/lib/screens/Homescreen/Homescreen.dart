import 'dart:developer';
import 'package:customer/constants.dart';
import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:customer/screens/SignupLogin/components/ImagePicker.dart';
import 'package:flutter/material.dart';

class CustHome extends StatefulWidget {
  const CustHome({super.key});

  @override
  State<CustHome> createState() => _CustHomeState();
}

class _CustHomeState extends State<CustHome> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          color: kPrimaryColor,
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
        ServiceCategories(),
      ]),

      // title: Text('Address placeholder'),

      // bottom: PreferredSize(
      //     preferredSize: Size.zero,
      //     child: Text(
      //         '#504 Neptune Street, Margarita Village, Bajada, Davao City')),
      // leading: Icon(Icons.pin_drop),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: myIndex,
          onTap: (int index) {
            setState(() {
              myIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: 'Chat'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
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
