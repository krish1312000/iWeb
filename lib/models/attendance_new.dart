import 'package:flutter/cupertino.dart';

class Attendance_New with ChangeNotifier{
  String subject;
  String division1;
  String division2;

  Attendance_New({required this.division1,required this.subject,required this.division2});
}