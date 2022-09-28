import 'package:flutter/material.dart';
import 'package:iweb/providers/taskProvider.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:iweb/widgets/taskItems.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  static const routeName = "/tasklist";


  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context,listen: false);
    final taskList = task.taskItems;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
            'Your Task List'
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
          value: taskList[i],
          child: TaskItems(),
        ),
        itemCount: taskList.length,)
    );
  }
}
