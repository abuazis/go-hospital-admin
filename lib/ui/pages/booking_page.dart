import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_hospital_admin/services/booking_service.dart';
import 'package:go_hospital_admin/ui/pages/login_page.dart';
import 'package:go_hospital_admin/ui/widget/book_list_card.dart';

class BookingPage extends StatefulWidget {
  static String routeName = "/booking";

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool isLoading = false;

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
        padding: EdgeInsets.fromLTRB(100.r, 50, 100.r, 50),
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
          StreamBuilder<QuerySnapshot>(
            stream: BookingService.bookingCollection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              if (snapshot.data!.docs.isNotEmpty) {
                return Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return BookListCard(
                      name: data['patient']['name'] ?? "",
                      purpose: data['purpose_type'] ?? "",
                      schedule: data['schedule'] ?? "",
                      price: data['total_price'] ?? "",
                      reportTime: DateTime.parse(
                          data['report_time'] ?? DateTime.now().toString()),
                      report: data['report'] ?? "",
                      onPressed: () {
                        BookingService.updateReport(document.id);
                      },
                    );
                  }).toList(),
                );
              } else {
                return Text("Data Tidak Tersedia");
              }
            },
          ),
        ],
      ),
    );
  }
}
