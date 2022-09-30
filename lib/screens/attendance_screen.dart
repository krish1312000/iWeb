import 'dart:core';

import 'package:flutter/material.dart';
import 'package:iweb/screens/attendancereport.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  static const routeName = '/attendancescreen';

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Your Attendance'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDate,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (selectday, focusday) {
                setState(() {
                  _selectedDate = selectday;
                  _focusedDay = focusday;
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(_selectedDate, date);
              },
              calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle)
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: const Text('Generate Summary')),
            )
          ],
        ),
      ),
    );
  }
}
