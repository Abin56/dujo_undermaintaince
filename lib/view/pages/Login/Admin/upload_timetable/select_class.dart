import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/view/constants/const.dart';
import 'package:dujo_website/view/pages/Login/Admin/upload_timetable/timetable_add_screen.dart';
//import 'package:dujo_website/view/pages/web/class_teacher/upload_timetable/timetable_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectClassForTimeTable extends StatefulWidget {
   SelectClassForTimeTable({super.key, required this.schoolID}); 

   String schoolID;

  @override
  State<SelectClassForTimeTable> createState() => _SelectClassForTimeTableState();
}

class _SelectClassForTimeTableState extends State<SelectClassForTimeTable> { 
 var classListValue;

 FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column( 
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text('Select Class', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),  

            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolID).collection('Classes').snapshots(),
              builder:  (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData){
                return  Center(
                  child: DropdownButtonFormField(
                              hint: classListValue == null
                    ? const Text(
                        "Select Class",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                      )
                    : Text(classListValue!["classID"]),
                              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                              ),
                              items: snapshot.data!.docs.map(
                  (val) {
                    return DropdownMenuItem(
                      value: val["classID"],
                      child: Text(val["classID"]),
                    );
                  },
                              ).toList(),
                              onChanged: (val) {
                  var categoryIDObject = snapshot.data!.docs
                      .where((element) => element["classID"] == val)
                      .toList()
                      .first;
                               
                  setState(
                    () {
                      classListValue = categoryIDObject;
                    },
                  );
                              },
                            ),
                );
              } 
              return CircularProgressIndicator();
            }),
            sizedBoxH20,
          //   DropdownButton<String>(
          // value: dropdownValue,
          // onChanged: (String? newValue) {
          //   setState(() {
          //     dropdownValue = newValue!;
          //   });
          // },
          // items: options.map<DropdownMenuItem<String>>((String value) {
          //   return DropdownMenuItem<String>(
          //     value: value,
          //     child: Text(value),
          //   );
          // }).toList(),
          // ),] 

          ElevatedButton(onPressed: (){
            print(classListValue!["classID"]);
           Navigator.push(context, MaterialPageRoute(builder: ((context) => TimeTableScreen(classID: classListValue!["classID"], schoolID: widget.schoolID,)))); 
            
          }, child: Text('OK'))
        ])




      ),
    );
  }
}