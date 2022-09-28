import 'package:flutter/material.dart';

class Attendance with ChangeNotifier{
  String subject;
  double percent;

  Attendance({required this.subject,required this.percent});
}