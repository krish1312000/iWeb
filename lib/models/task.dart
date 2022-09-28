import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  String module;
  String university;
  String requestedBy;
  String requestedOn;
  String additionalDetails;

  Task(
      {required this.module,
      required this.university,
      required this.additionalDetails,
      required this.requestedBy,
      required this.requestedOn}
      );
}
