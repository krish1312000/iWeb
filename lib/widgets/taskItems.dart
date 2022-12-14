import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iweb/providers/taskProvider.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class TaskItems extends StatefulWidget {
  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  String initialAction = "Forward";

  //var _expanded = false;
  @override
  Widget build(BuildContext context) {
    final taskitem = Provider.of<Task>(context);
    final tasklist = Provider.of<TaskProvider>(context);
    final taskitemlist = tasklist.taskItems;
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Req. For  : ${taskitem.module}",
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            /* subtitle: Row(
              children: [
                Text(
                  taskitem.module,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.orangeAccent
                  ),
                ),
                const SizedBox(width: 20,),
                Text("Requested on: ${taskitem.requestedOn}",style: const TextStyle(color: Colors.black87,fontSize: 15),),
              ],
            ),*/

            /*trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              color: Colors.orangeAccent,
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),*/
          ),
          const Divider(color: Colors.orange),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            height: min(taskitemlist.length * 20 + 100, 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Req. Dt.     : ${taskitem.requestedOn}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Colors.orange,
                ),
                Text(
                  "Req. From : ${taskitem.university}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Colors.orange,
                ),
                Text(
                  "Req. By      : ${taskitem.requestedBy}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(color: Colors.orange),
                Row(
                  children: [
                    const Text(
                      'Actions      : ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.only(
                            left: 1, right: 1, top: 1, bottom: 1),
                        child: DropdownButtonFormField(
                          elevation: 3,
                          hint: const Text(
                            "",
                            softWrap: true,
                          ),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: (BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                  )))),
                          alignment: Alignment.topCenter,
                          onChanged: (value) {
                            setState(() {
                              initialAction = value.toString();
                            });
                          },
                          items: ['Approve', 'Forward', 'Revert']
                              .map<DropdownMenuItem<String>>((String val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(
                                val,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.orange),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Details       : ${taskitem.additionalDetails}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                /*ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                  ),
                    onPressed: (){},
                    child: const Text('View',style: TextStyle(fontSize: 16),),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
