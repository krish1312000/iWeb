import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iweb/models/attendance.dart';
import 'package:iweb/providers/attendanceProvider.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class AttendanceReport extends StatefulWidget {
  static const routeName = '/attendancereport';

  @override
  _AttendanceReportState createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  @override
  Widget build(BuildContext context) {
    final att = Provider.of<AttendanceProvider>(context);
    final attdata = att.attendanceItems;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Attendance Reports'),
        backgroundColor: Colors.black87,
      ),
      body:
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 60,
        ),
        itemBuilder: (ctx,i) => GridTile(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                width: 100,
                  child: CircularPercentIndicator(
                    radius: 60,
                    lineWidth: 13,
                    circularStrokeCap: CircularStrokeCap.butt,
                    animation: true,
                    percent: attdata[i].percent/100,
                    progressColor: Colors.orangeAccent,
                    center: Text(attdata[i].percent.toString() + '%',softWrap: true, style: TextStyle(
                      fontSize: 30,
                    ),),
                  ),
                ),
                SizedBox(height: 7,),
                Text(attdata[i].subject,style: TextStyle(
                  fontSize: 18,
                ),)
              ],
            ),
          ),
        ),itemCount: attdata.length,
        /*child:CircularPercentIndicator(
                      radius: 35,
                      lineWidth: 10,
                      animation: true,
                      percent: 0.7,
                      progressColor: Colors.orangeAccent,
                      center: const Text('70.0%'),*/
      ),
    );
  }
}
