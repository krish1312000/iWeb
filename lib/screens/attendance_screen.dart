import 'package:flutter/material.dart';
import 'package:iweb/screens/attendancereport.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../models/attendance.dart';

class AttendanceScreen extends StatefulWidget {
  static const routeName = '/attendancescreen';



  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
 final List _academicYear = ["2020-21","2021-22"];
  final List _semester = ["Semester I","Semester II","Semester III","Semester IV"];
  final List _program = ["MBBS","Physiology","Anatomy","Biochemistry"];

   _dropdown(List options, String initialVal,String hint){
   return Container(
     padding: const EdgeInsets.all(15),
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
     child: Form(
       child: DropdownButtonFormField(
         decoration: const InputDecoration(
             prefixIcon: Icon(Icons.calendar_today_sharp,color: Colors.orangeAccent,),
             enabledBorder: OutlineInputBorder(
                 borderSide: (BorderSide(color: Colors.black87,width: 2))
             )
         ),
         hint: Text(hint),
          items: options.map<DropdownMenuItem<String>>((val){
            return DropdownMenuItem(
                value: val,
                child: Text(val),);
          }).toList(),
          onChanged: (val) {
            setState(() {
              initialVal = val.toString();
            });
          },
        ),
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Your Attendance'),
      ),
      body: Column(
        children: [
          _dropdown(_academicYear, "","Choose the academic year"),
          _dropdown(_semester, "","Choose a semester"),
          _dropdown(_program,"","Choose a program"),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                onPressed: (){
                  Navigator.of(context).pushNamed(AttendanceReport.routeName);
                },
                child: const Text(
                    'Click to see a report',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
   );
  }
}
