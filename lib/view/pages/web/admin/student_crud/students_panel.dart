import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_website/model/create_classModel/addStudent_model.dart';
import 'package:dujo_website/view/pages/web/admin/student_crud/add_student.dart';
import 'package:dujo_website/view/pages/web/class_teacher/add_student.dart';
import 'package:dujo_website/view/pages/web/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StudentsPanel extends StatefulWidget {
   StudentsPanel({super.key, required this.id, required this.classId}); 
  
  String id; String classId;

  @override
  State<StudentsPanel> createState() => _StudentsPanelState();
}

class _StudentsPanelState extends State<StudentsPanel> {
  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container( 
        color: Colors.green, 
        height: 400,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('schoolListCollection').doc(widget.id).collection('Classes').doc(widget.classId).collection('Students').snapshots(),
          builder: ((context, snapshot) {
         
            if(snapshot.hasData){
              
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){ 
                   final data = AddStudentsModel.fromJson(
                                          snapshot.data!.docs[index].data());
                return Text(data.parentName);
              });
            } else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            })
          
        ),
      ));
      
      }
}