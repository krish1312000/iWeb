import 'package:flutter/material.dart';
import 'package:iweb/providers/attendanceProviderNew.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:iweb/widgets/attendance_layout.dart';
import 'package:provider/provider.dart';

class AttendanceReportNew extends StatefulWidget {


  @override
  _AttendanceReportNewState createState() => _AttendanceReportNewState();
}

class _AttendanceReportNewState extends State<AttendanceReportNew> {
  @override
  Widget build(BuildContext context) {
    final attData = Provider.of<AttendanceProviderNew>(context);
    final attList = attData.newattendanceItems;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
          value: attList[i],
          child: AttendanceLayout(),
        ),
        itemCount: attList.length,
      ),
    );
  }
}
