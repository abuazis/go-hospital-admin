import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_hospital_admin/shared/color.dart';

class BookListCard extends StatelessWidget {
  final String name;
  final String purpose;
  final String schedule;
  final String price;
  final DateTime reportTime;
  final String report;
  final void Function()? onPressed;
  final void Function()? onDownload;

  BookListCard({
    required this.name,
    required this.purpose,
    required this.schedule,
    required this.price,
    required this.reportTime,
    required this.report,
    this.onPressed,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(
        bottom: 24,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "$purpose ($price)",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: blackColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        schedule,
                        style: TextStyle(
                          fontSize: 14,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    reportTime.isBefore(DateTime.now()) || report == "Selesai"
                        ? Icons.check_circle
                        : Icons.timer,
                    size: 30,
                    color: reportTime.isBefore(DateTime.now()) ||
                            report == "Selesai"
                        ? Colors.green
                        : Colors.yellow,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: reportTime.isBefore(DateTime.now()) ||
                            report == "Selesai"
                        ? null
                        : onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      reportTime.isBefore(DateTime.now()) || report == "Selesai"
                          ? "Selesai"
                          : "Konfirmasi Selesai",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: onDownload,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    child: Icon(
                      Icons.file_download,
                      size: 24,
                      color: baseColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
