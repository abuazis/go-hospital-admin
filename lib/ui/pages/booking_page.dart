import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_hospital_admin/shared/color.dart';
import 'package:go_hospital_admin/ui/pages/login_page.dart';
import 'package:go_hospital_admin/ui/widget/book_list_card.dart';

class BookingPage extends StatefulWidget {
  static String routeName = "/booking";

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                LoginPage.routeName,
              );
            },
          ),
        ],
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            "Go Hospital",
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(100.r, 50, 100.r, 0),
        children: [
          Text(
            "List Booking Pasien",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              BookListCard(),
              BookListCard(),
              BookListCard(),
              BookListCard(),
            ],
          ),
        ],
      ),
    );
  }
}
