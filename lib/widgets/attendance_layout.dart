import 'package:flutter/material.dart';
import 'package:iweb/models/attendance_new.dart';
import 'package:provider/provider.dart';

class AttendanceLayout extends StatefulWidget {
  @override
  State<AttendanceLayout> createState() => _AttendanceLayoutState();
}

class _AttendanceLayoutState extends State<AttendanceLayout> {
  var _isATapped = false;
  var _isBTapped = false;

  @override
  Widget build(BuildContext context) {
    final att = Provider.of<Attendance_New>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                att.subject,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isBTapped = false;
                          });
                          _isATapped = true;
                        },
                        child: CircleAvatar(
                          child: const Text(
                            'A',
                            style:
                            TextStyle(fontSize: 20, color: Colors.black87),
                          ),
                          backgroundColor:
                          _isATapped ? Colors.green : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isATapped = false;
                          });
                          _isBTapped = true;
                        },
                        child: CircleAvatar(
                          child: const Text(
                            'B',
                            style:
                            TextStyle(fontSize: 20, color: Colors.black87),
                          ),
                          backgroundColor:
                          _isBTapped ? Colors.green : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
