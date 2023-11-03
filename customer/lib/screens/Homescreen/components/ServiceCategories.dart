import 'package:customer/constants.dart';
import 'package:customer/screens/FreelancerCategoryScreens/FaceandSkin.dart';
import 'package:customer/screens/FreelancerCategoryScreens/Hair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceCategories extends StatefulWidget {
  const ServiceCategories({super.key});

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HairFreelancers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          color: Colors.white,
          child: Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/hair.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Hair')
                        ],
                      )),
                      onTap: () {}),
                ),
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/makeup.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Makeup')
                        ],
                      )),
                      onTap: () {}),
                ),
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/spa.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Spa')
                        ],
                      )),
                      onTap: () {}),
                ),
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/nails.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Nails')
                        ],
                      )),
                      onTap: () {}),
                ),
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/lashes.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Lashes')
                        ],
                      )),
                      onTap: () {}),
                ),
                Expanded(
                  child: InkWell(
                      child: Container(
                          child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/face & skin.svg',
                            height: 40,
                            width: 40,
                          ),
                          Text('Face & Skin')
                        ],
                      )),
                      onTap: () {}),
                ),
              ],
            ),
          )),
    );
  }
}
