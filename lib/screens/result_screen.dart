import 'package:flutter/material.dart';
import 'package:iweb/widgets/MainDrawer.dart';


class ResultScreen extends StatefulWidget {
  static const routeName = "/resultscreen";

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  String initialSemester = "Choose the Semester";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title:const Text(
          'Your Results',
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: DropdownButtonFormField(
              elevation: 3,
              hint: const Text("Choose the Semester"),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.school_outlined,color: Colors.orangeAccent,),
                enabledBorder: OutlineInputBorder(
                  borderSide: (BorderSide(color: Colors.black87,width: 2))
                )
              ),
                alignment: Alignment.topCenter,
                onChanged: (value) {
                setState(() {
                  initialSemester = value.toString();
                });
              },
                items: ['Semester I','Semester II','Semester III','Semester IV']
                    .map<DropdownMenuItem<String>>((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),);
                }).toList(),),
          ),
        ],
    )
    );
  }
}
