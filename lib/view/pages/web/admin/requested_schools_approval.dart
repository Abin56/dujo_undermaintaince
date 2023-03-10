import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RequestedSchoolsApproval extends StatelessWidget {
   RequestedSchoolsApproval({super.key}); 

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _firestore.collection('RequestedSchools').snapshots(),
        builder: ((context, snapshot) { 
         List<QueryDocumentSnapshot<Map<String, dynamic>>> documents= snapshot.data!.docs;
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } 
           if (snapshot.hasData) { 
             if(documents.length>0){
              return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(documents[index]['schoolName']),
                );
            }); 
            
             }
             
            }  return Center(
                child: Text('Something went wrong'),
              );
          
      })),
    );
  }
}