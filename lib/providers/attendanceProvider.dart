import 'package:flutter/cupertino.dart';
import 'package:iweb/models/attendance.dart';

class AttendanceProvider with ChangeNotifier {
  List<Attendance> _attendanceItems = [
    Attendance(
        subject: "Anatomy",
        percent: 70
    ),
    Attendance(
        subject: "Physiology",
        percent: 60
    ),
    Attendance(
        subject: "Biochemistry",
        percent: 50
    ),
    Attendance(
        subject: "Community Medicine",
        percent: 40
    ),
  ];

  List<Attendance> get attendanceItems{
    return[..._attendanceItems];
  }
}