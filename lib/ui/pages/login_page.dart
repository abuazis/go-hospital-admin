import 'package:flutter/material.dart';
import 'package:go_hospital_admin/shared/color.dart';
import 'package:go_hospital_admin/ui/pages/booking_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.r,
          ),
          child: Text(
            "Go Hospital Admin",
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Administrator",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              "Silahkan Masukan Akun Admin Milik Anda Yang Telah Terdaftar",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            isLoading
                ? SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: accentColor,
                      strokeWidth: 8,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });

                      if (emailController.text == "admin@root.com" &&
                          passwordController.text == "101010") {
                        Navigator.pushReplacementNamed(
                          context,
                          BookingPage.routeName,
                        );
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 190,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
