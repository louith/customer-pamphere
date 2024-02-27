import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/components/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/components/getVerified.dart';
import 'package:customer/screens/indivProfile/indivWorkerProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;

class AllWorkerCard {
  final String name;
  final String address;
  final List<String> categories;
  final String id;

  AllWorkerCard(
      {required this.id,
      required this.name,
      required this.address,
      required this.categories});
}

class AllWorkers extends StatefulWidget {
  const AllWorkers({super.key});

  @override
  State<AllWorkers> createState() => _AllWorkersState();
}

class _AllWorkersState extends State<AllWorkers> {
  final TextEditingController searchController = TextEditingController();
  late Stream<List<AllWorkerCard>> _stream;

  Future<AllWorkerCard?> getAllWorkerCard(String plainID) async {
    final DocumentSnapshot profile =
        await db.collection('users').doc(plainID).get();

    Map<String, dynamic> profileMap = profile.data() as Map<String, dynamic>;

    final QuerySnapshot<Map<String, dynamic>> category = await db
        .collection('users')
        .doc(plainID)
        .collection('categories')
        .get();
    //gets hair subcollection document
    // Map<String, dynamic> lashesMap = lashes.data() as Map<String, dynamic>;

    //adds subcategories to a list
    // List<String> lashesSubCats = lashesMap.keys.toList();
    final catDocs = category.docs.map((doc) => doc.id).toList();
    return AllWorkerCard(
        id: plainID.toString(),
        name: profileMap['name'],
        address: profileMap['address'],
        categories: catDocs);
  }

  Future<List<AllWorkerCard>> getAll() async {
    List<Future<AllWorkerCard?>> futures = [];
    for (var plainID in (await getPlainDocIds())) {
      futures.add(getAllWorkerCard(plainID));
    }
    List<AllWorkerCard?> allWorkersWithNull =
        await Future.wait<AllWorkerCard?>(futures);
    return allWorkersWithNull.whereType<AllWorkerCard>().toList();
  }

  // _stream = Stream.fromFuture(getAll());
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.fromFuture(getAll()),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          } else {
            List<AllWorkerCard> allWorkers = snapshot.data!;
            return ListView.builder(itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  //boxshadow code/styling
                ),
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
                        allWorkers[index].name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      CategoriesRow(itemList: allWorkers[index].categories),
                      Text(allWorkers[index].address,
                          style: const TextStyle(fontWeight: FontWeight.w300)),
                      // Text(hairWorkers[index].id.toString())
                    ],
                  ),
                  shape: RoundedRectangleBorder(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndivWorkerProfile(
                              userID: allWorkers[index].id.toString())),
                    );
                  },
                ),
              );
            });
          }
        });
  }
}

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key, required this.itemList});

  final List<dynamic> itemList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
      ),
    );
  }
}
