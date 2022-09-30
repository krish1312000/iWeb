import 'package:flutter/cupertino.dart';
import 'package:iweb/models/attendance_new.dart';

class AttendanceProviderNew with ChangeNotifier {
  List <Attendance_New> _newAttendance =[
    Attendance_New(
        division1: 'A',
        subject: 'Anatomy',
        division2: 'B'),
    Attendance_New(
        division1: 'A',
        subject: 'Pshycology',
        division2: 'B'
    ),
    Attendance_New(
        division1: 'A',
        subject: 'BioChemistry',
        division2: 'B'
    ),
    Attendance_New(
        division1: 'A',
        subject: 'Community Medicine',
        division2: 'B'
    ),
  ];

  List<Attendance_New> get newattendanceItems{
    return[..._newAttendance];
  }
}