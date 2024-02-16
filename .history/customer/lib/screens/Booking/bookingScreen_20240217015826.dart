import 'package:customer/components/constants.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Booking indiv worker'),
      ),
    );
    ;
  }
}
