import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_hospital_admin/shared/color.dart';
import 'package:go_hospital_admin/shared/route.dart';
import 'package:go_hospital_admin/ui/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1366, 671),
      builder: () => MaterialApp(
        title: "Go Hospital Admin",
        routes: appRoute,
        theme: ThemeData(
          primaryColor: accentColor,
          accentColor: baseColor,
        ),
        home: Wrapper(),
      ),
    );
  }
}