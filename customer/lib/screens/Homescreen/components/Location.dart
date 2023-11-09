import 'package:customer/screens/Homescreen/Homescreen.dart';
import 'package:customer/screens/Homescreen/components/ServiceCategories.dart';
import 'package:flutter/material.dart';

class LocationHome extends StatefulWidget {
  const LocationHome({super.key});

  @override
  State<LocationHome> createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 160,
      // padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
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
          ServiceCategories()
        ],
      ),
    );
  }
}
