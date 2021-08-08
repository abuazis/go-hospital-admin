import 'package:flutter/material.dart';
import 'package:go_hospital_admin/ui/pages/booking_page.dart';
import 'package:go_hospital_admin/ui/pages/login_page.dart';
import 'package:go_hospital_admin/ui/wrapper.dart';

Map<String, WidgetBuilder> appRoute = {
  Wrapper.routeName: (BuildContext context) => Wrapper(),
  LoginPage.routeName: (BuildContext context) => LoginPage(),
  BookingPage.routeName: (BuildContext context) => BookingPage(),
};