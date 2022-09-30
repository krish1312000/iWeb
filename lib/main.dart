import 'package:flutter/material.dart';
import 'package:iweb/models/sqlconnection.dart';
import 'package:iweb/providers/attendanceProvider.dart';
import 'package:iweb/models/auth.dart';
import 'package:iweb/providers/attendanceProviderNew.dart';
import 'package:iweb/providers/homeprovider.dart';
import 'package:iweb/providers/taskProvider.dart';
import 'package:iweb/screens/AuthScreen.dart';
import 'package:iweb/screens/TaskList.dart';
import 'package:iweb/screens/attendanceReportNew.dart';
import 'package:iweb/screens/attendance_screen.dart';
import 'package:iweb/screens/attendancereport.dart';
import 'package:iweb/screens/menu_screen.dart';
import 'package:iweb/screens/result_screen.dart';
import 'package:iweb/screens/tab_screen.dart';
import 'package:iweb/screens/timetablescreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (ctx)=>HomeProvider()
          ),
          ChangeNotifierProvider(
              create: (ctx)=> Auth()
          ),
          ChangeNotifierProvider(
            create: (ctx) => AttendanceProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => TaskProvider(),
          ),
          /*ChangeNotifierProvider(
            create: (ctx) => SqlConnection(password: '', email: ''),
          ),*/
          ChangeNotifierProvider(
              create: (ctx) => AttendanceProviderNew()
          )
        ],
        child: Consumer<Auth>(
          builder: (ctx,auth,_) => MaterialApp(
            title: 'iWeb',
            theme: ThemeData(
              primaryColor: Colors.blue.shade900,
            ),
            home:  AttendanceReportNew(),//auth.isAuth? TabScreen() : AuthScreen(),
            routes: {
              MenuScreen.routeName: (ctx) => MenuScreen(),
              ResultScreen.routeName: (ctx)=>ResultScreen(),
              AttendanceScreen.routeName: (ctx) => AttendanceScreen(),
              TabScreen.routeName:(ctx) => TabScreen(),
              AttendanceReport.routeName: (ctx) => AttendanceReport(),
              TimeTableScreen.routeName: (ctx) => TimeTableScreen(),
              TaskList.routeName: (ctx) => TaskList(),


            },
          ),
        )
    );
  }
}
