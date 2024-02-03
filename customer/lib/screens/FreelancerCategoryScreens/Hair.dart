import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
//document IDs based off selected query

//Strings to assign to text widgets (fieldnames)
//freelancers & salons
String address = '';
String name = '';

//feedbacks tba
List<dynamic> fFeedbacks = [];
List<dynamic> sFeedbacks = [];

List<dynamic> hairSubCats = [];
List<dynamic> hairList = [];

// List<dynamic> salonPlaindocIds = [];

Future<void> getHairs() async {
  for (String plainID in plaindocIds) {
    try {
      bool hairExists;

      final DocumentSnapshot hairs = await db
          .collection('users')
          .doc(plainID)
          .collection('categories')
          .doc('Hair')
          .get();

      Map<String, dynamic> hairsMap = hairs.data() as Map<String, dynamic>;

      hairSubCats = hairsMap.keys.toList();

      if (hairs.exists) {
        print('Hairs exist');

        hairList.add(plainID);

        final DocumentSnapshot profile =
            await db.collection('users').doc(plainID).get();

        Map<String, dynamic> profileMap =
            profile.data() as Map<String, dynamic>;

        name = profileMap[name];
        address = profileMap[address];
      } else {
        print('NO HAIRS =_=');
      }
      // print(plainID);
    } catch (e) {
      print('Error getting data');
    }
  }
}

class HairFreelancers extends StatefulWidget {
  const HairFreelancers({super.key});

  @override
  State<HairFreelancers> createState() => _HairFreelancersState();
}

class _HairFreelancersState extends State<HairFreelancers> {
  @override
  void initState() {
    super.initState();
    getPlainDocIds();
    getHairs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('hshs'),
          ElevatedButton(onPressed: getHairs, child: Text('hhaha')),
          Expanded(
              child: ListView.builder(
                  itemCount: hairList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ],
                      ),
                      // border: BorderDirectional(
                      //     top: BorderSide(
                      //         width: 1, color: Colors.black38))),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/suzy.jpg',
                          width: 50,
                          height: 50,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SubCategoriesRow(itemList: hairSubCats),
                            Text(
                              'Subtitle',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        shape: RoundedRectangleBorder(),
                        onTap: () {},
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class SubCategoriesRow extends StatelessWidget {
  const SubCategoriesRow({super.key, required this.itemList});

  final List<dynamic> itemList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemList.length,
        (index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
          decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(100)),
          child: Text(itemList[index]),
        ),
      ),
    );
  }
}
