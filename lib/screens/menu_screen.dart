import 'package:flutter/material.dart';
import 'package:iweb/providers/homeprovider.dart';
import 'package:iweb/widgets/MenuItems.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menuscreen';

  @override
  Widget build(BuildContext context) {
    final menuData = Provider.of<HomeProvider>(context);
    final menuItem = menuData.menuitems;
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: menuItem[i],
        child: MenuItems(
         /* imagePath: menuItem[i].imagePath,
          title: menuItem[i].title,
          screen: menuItem[i].screen.toString(),*/
        ),
      ),
      itemCount: menuItem.length,
    );
  }
}
