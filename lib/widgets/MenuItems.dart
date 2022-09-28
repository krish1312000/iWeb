import 'package:flutter/material.dart';
import 'package:iweb/models/home.dart';
import 'package:provider/provider.dart';


class MenuItems extends StatelessWidget {
  /*final String imagePath;
  final String title;
  final String screen;

  MenuItems(
      {required this.imagePath, required this.title, required this.screen});*/

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<HomeMenu>(context,listen: false);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(items.screen.toString());
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: GridTile(
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              radius: 150,
              child: ClipRRect(
                child: Image.asset(
                  items.imagePath,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 18,
            child: GridTileBar(
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  items.title,
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 16,
                      backgroundColor: Colors.orangeAccent,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
