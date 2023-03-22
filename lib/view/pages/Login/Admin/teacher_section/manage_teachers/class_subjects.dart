// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../model/get_classwise_subject.dart';

// class ClassWiseSubject extends StatefulWidget {
//   var schoolID;
//   var classID;
//   var teacherID;
//   ClassWiseSubject(
//       {required this.schoolID,
//       required this.classID,
//       required this.teacherID,
//       super.key});

//   @override
//   State<ClassWiseSubject> createState() => _ClassWiseSubjectState();
// }

// class _ClassWiseSubjectState extends State<ClassWiseSubject> {
//   // Map<String, bool?> presentlist = {};
//   // List addedList = [];
// //if user press add or remove then this map will be updated
//   Map<String,dynamic>subjectMap=<String,dynamic>{};

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Class subjects'),
//       ),
//       body: SafeArea(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("SchoolListCollection")
//               .doc(widget.schoolID)
//               .collection("Classes")
//               .doc(widget.classID)
//               .collection("Subjects")
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView(
//                 //mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     width: double.maxFinite,
//                     child: ListView.separated(
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           final data = GetClassWiseSubjectModel.fromJson(
//                               snapshot.data!.docs[index].data());

//                           return GestureDetector(
//                             onTap: () async {},
//                             child: Container(
//                               height: 60,
//                               width: double.infinity,
//                               // color: presentlist[data.subject] == null
//                               //     ? Colors.transparent
//                               //     : presentlist[data.subject] == true
//                               //         ? Colors.green
//                               //         : Colors.red,
//                               child: Center(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text(data.subject),
//                                     TextButton.icon(
//                                         onPressed: () async {
//                            subjectMap.putIfAbsent(data.subject,()=>data.subject);

//                                           // setState(() {
//                                           //   presentlist[data.subject] = true;
//                                           // });

// //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Adding taechers>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//                                           // final List<Map<String, List<String>>>
//                                           //     listofMap = [];

//                                           //     var listofsubject=[];
//                                           //       FirebaseFirestore.instance
//                                           // .collection("SchoolListCollection")
//                                           // .doc(widget.schoolID)
//                                           // .collection("Teachers")
//                                           // .doc(widget.teacherID)
//                                           // .set(
//                                           //   listofsubject.add({
//                                           //     'subject$index':data.id,
//                                           //   })
//                                           // ,SetOptions(merge: true));
//                                         },
//                                         icon: Icon(Icons.add),
//                                         label: Text('add')),
//                                     TextButton.icon(
//                                         onPressed: () async {
//                                           //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Removing>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//                                           if(subjectMap.containsKey(data.subject)){
// subjectMap.remove(data.subject);
//                                           }
//                                           // setState(() {
//                                           //   presentlist[data.subject] = false;
//                                           // });
//                                           //     var listofsubject=[];
//                                           //       FirebaseFirestore.instance
//                                           // .collection("SchoolListCollection")
//                                           // .doc(widget.schoolID)
//                                           // .collection("Teachers")
//                                           // .doc(widget.teacherID)
//                                           // .set(
//                                           //   listofsubject.add({
//                                           //     'subject$index':data.id,
//                                           //   })
//                                           // ,SetOptions(merge: true));
//                                         },
//                                         icon: Icon(Icons.delete),
//                                         label: Text('remove'))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider();
//                         },
//                         itemCount: snapshot.data!.docs.length),
//                   ),
//                   ElevatedButton(onPressed: ()=>addSubjectToTeacher(subjectData:subjectMap ), child: const Text('Submit'),)
//                 ],
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   void addSubjectToTeacher({required Map<String,dynamic>subjectData}){
//          final firebaseFirestore=  FirebaseFirestore.instance.collection("SchoolListCollection").doc(widget.schoolID)
//           .collection("Teachers").doc(widget.teacherID).collection('teacherClasses').doc(widget.classID);
// subjectData.forEach((key, value) {
//   firebaseFirestore.collection('subjects').doc(key).set(<String,dynamic>{key:value,},);
//  });
//   }

//   void getMapData()async{
//     subjectMap.clear();
//      QuerySnapshot<Map<String, dynamic>> firebaseFirestore= await FirebaseFirestore.instance.collection("SchoolListCollection").doc(widget.schoolID)
//           .collection("Teachers").doc(widget.teacherID).collection('teacherClasses').doc(widget.classID).collection('subjects').get();
//           for (var element in firebaseFirestore.docs) {
//             subjectMap.putIfAbsent(element.id, () => element.data()[element.id]);
//            }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/get_classwise_subject.dart';

class ClassWiseSubject extends StatefulWidget {
  final String schoolID;
  final String classID;
  final String teacherID;
  const ClassWiseSubject(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  State<ClassWiseSubject> createState() => _ClassWiseSubjectState();
}

class _ClassWiseSubjectState extends State<ClassWiseSubject> {
  Map<String, dynamic> subjectMap = <String, dynamic>{};
  @override
  void initState() {
    getMapData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Teachers")
        .doc(widget.teacherID)
        .collection('teacherClasses')
        .doc(widget.classID);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class subjects'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(widget.schoolID)
              .collection("Classes")
              .doc(widget.classID)
              .collection("Subjects")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = GetClassWiseSubjectModel.fromJson(
                              snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () async {},
                            child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: ListTile(
                                  title: Text(data.subject),
                                  trailing: TextButton.icon(
                                    onPressed: () async {
                                      if (subjectMap
                                          .containsKey(data.subject)) {
                                        subjectMap.remove(data.subject);
                                        await firebaseFirestore
                                            .collection('subjects')
                                            .doc(data.subject)
                                            .delete();
                                        await getMapData();
                                      } else {
                                        subjectMap.putIfAbsent(
                                            data.subject, () => data.subject);
                                        firebaseFirestore
                                            .collection('subjects')
                                            .doc(data.subject)
                                            .set(
                                          <String, dynamic>{
                                            data.subject: data.subject,
                                          },
                                        );
                                        await getMapData();
                                      }
                                      setState(() {});
                                    },
                                    icon: subjectMap.containsKey(data.subject)
                                        ? const Icon(Icons.delete)
                                        : const Icon(Icons.add),
                                    label: subjectMap.containsKey(data.subject)
                                        ? const Text('remove')
                                        : const Text('add'),
                                  ),
                                )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> getMapData() async {
    subjectMap.clear();
    ///init state this function will call and update [subjectMap]. 
    QuerySnapshot<Map<String, dynamic>> firebaseFirestore =
        await FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection("Teachers")
            .doc(widget.teacherID)
            .collection('teacherClasses')
            .doc(widget.classID)
            .collection('subjects')
            .get();
    for (var element in firebaseFirestore.docs) {
      subjectMap.putIfAbsent(element.id, () => element.data()[element.id]);
    }
    
    setState(() {
      print(subjectMap);
    });
  }
}
