import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({super.key});

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Services Offered'),
      ),
    );
  }
}
