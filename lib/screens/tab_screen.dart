import 'package:flutter/material.dart';
import 'package:iweb/screens/menu_screen.dart';
import 'package:iweb/widgets/MainDrawer.dart';

import 'notifications_screen.dart';

class TabScreen extends StatelessWidget {
  static const routeName = "/tabsscreen";


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Container(
              padding: const EdgeInsets.only(left: 1),
              child: Image.asset(
                "lib/assets/images/V1@3x.png",
                fit: BoxFit.cover,
                width: 200,
                height: 150,
                alignment: Alignment.center,
              ),
            ),
          bottom:TabBar(
            unselectedLabelColor: Colors.grey.shade400,
            tabs: const [
               Tab(icon: Icon(Icons.home),
              text: 'Home',
              ),
               Tab(icon: Icon(Icons.notifications),
              text: 'Notifications',)
            ],
          ),
          ),
          body:
             TabBarView(
              children: [
                MenuScreen(),
                NotificationsScreen(),
              ],
            ),

        )
    );
  }
}
