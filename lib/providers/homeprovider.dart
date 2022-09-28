import 'package:flutter/material.dart';
import 'package:iweb/models/home.dart';


class HomeProvider with ChangeNotifier{
   List<HomeMenu> _menuitems = [
      HomeMenu(
          imagePath: 'lib/assets/images/attendance.png',
          title: "Attendance",
          screen: '/attendancescreen',

      ),
      HomeMenu(
          imagePath: 'lib/assets/images/online-course.png',
          title: "Courses",
         // screen: CoursesScreen(),
      ),
      HomeMenu(
          imagePath: 'lib/assets/images/results.png',
          title: "Results",
         screen: '/resultscreen',
      ),
      HomeMenu(
          imagePath: 'lib/assets/images/schedule.png',
          title: "Time Table",
          screen: '/timetablescreen',
      ),
      HomeMenu(
          imagePath: 'lib/assets/images/home.png',
          title: "Dashboard",
          //screen: DashboardScreen(),
      ),
     HomeMenu(
       imagePath: 'lib/assets/images/campus.png',
       title: "Campus",
     //  screen: CampusScreen(),
     ),
     HomeMenu(
       imagePath: 'lib/assets/images/list.png',
       title: "Task List",
       screen: '/tasklist'
     )
   ];

   List<HomeMenu> get menuitems{
      return [..._menuitems];
   }


}