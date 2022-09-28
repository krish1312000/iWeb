import 'package:flutter/material.dart';
import 'package:iweb/widgets/MainDrawer.dart';
import 'package:intl/intl.dart';

class TimeTableScreen extends StatefulWidget {
  static const routeName = '/timetablescreen';

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  List<dynamic> timeAndSubject = [
    {"Timings" : "8:30 - 9:30" , "Subject" : "Physiology"},
    {"Timings" : "9:30 - 10:30" , "Subject" : "Anatomy"},
    {"Timings" : "10:30 - 11:30" , "Subject" : "BioChemitsry"},
    {"Timings" : "11:30 - 12:30" , "Subject" : "Physiology"}
  ];
 DateTime? _selectedData;
  void _datePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2023),
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedData = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Your time table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
                child: const Text(
                    'Choose a date to get a Time Table',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                  onPressed: (){
                     _datePicker();
                  },
              ),
            ),const SizedBox(height: 5,),
            Text(
                _selectedData == null
                    ? 'No Date Chosen!'
                    : 'Picked Date:  ${DateFormat.yMMMd().format(_selectedData!)} ',
              style:const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                 Text('Timings',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                 Text('Subjects',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 5,),
            const Divider(height: 5,thickness: 3,color: Colors.blueAccent,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent,width: 3)
              ),
              padding: const EdgeInsets.all(8),
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (ctx, i){
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(timeAndSubject[i]['Timings'], style: const TextStyle(fontSize: 20),),
                          const SizedBox(width: 50),
                          Text(timeAndSubject[i]['Subject'],style: const TextStyle(fontSize: 20)),
                        ],
                    );
                  },
                  separatorBuilder:(ctx,i){
                    return const SizedBox(height: 10,);
      },

                  itemCount: timeAndSubject.length),
            )
          ],
        ),
      )
        );
  }
}
