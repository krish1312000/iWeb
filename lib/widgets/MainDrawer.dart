import 'package:flutter/material.dart';
import 'package:iweb/models/auth.dart';
import 'package:iweb/screens/tab_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.black87,
              child: (const Icon(Icons.person_pin,size: 70,color: Colors.orangeAccent,))
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
              leading: const Icon(
                Icons.home,size: 26,color: Colors.orangeAccent,),
              title: const Text(
                'Home',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.of(context).pushNamed(TabScreen.routeName);
              }
          ),
          const Divider(),
          ListTile(
              leading: const Icon(
                Icons.logout,size: 26,color: Colors.orangeAccent,),
              title: const Text(
                'Logout',
                style:  TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                ),
              ),
              onTap: (){
                Navigator.of(context).pop();
                Provider.of<Auth>(context,listen: false).logout();
              }
          ),
        ],
      ),
    );
  }
}
