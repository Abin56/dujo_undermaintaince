import 'package:dujo_website/view/constants/const.dart';
import 'package:flutter/material.dart';

import '../../../../../model/time_table/addtodatabase.dart';
import '../../../../../model/time_table/time-tabel_model.dart';

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen({super.key, required this.classID, required this.schoolID}); 

  String classID;
  String schoolID;

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  TextEditingController numberOfPeriodsController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  List<TextEditingController> mondayList = [
    TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(),TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
  ]; 

    List<TextEditingController> tuesdayList = [
    TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(),TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
  ]; 

    List<TextEditingController> wednesdayList = [
    TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(),TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
  ];

    List<TextEditingController> thursdayList = [
    TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(),TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
  ]; 
    List<TextEditingController> fridayList = [
    TextEditingController(), TextEditingController(),
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(),TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
    TextEditingController(), TextEditingController(), 
  ]; 


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 189, 142),
        appBar: AppBar(
          title: Text('Add Timetable'),
          actions: [
            ElevatedButton(
              onPressed: ()async { 

                //monday timetable
                MondayModel Mondaymodel = await MondayModel(firstPeriod: {'firstPeriod': mondayList[0].text, 'firstPeriodTeacher': mondayList[1].text},
                 secondPeriod: {'secondPeriod': mondayList[2].text, 'secondPeriodTeacher': mondayList[3].text},
                  thirdPeriod: {'thirdPeriod': mondayList[4].text, 'thirdPeriodTeacher': mondayList[5].text},
                   fouthPeriod: {'fourthPeriod': mondayList[6].text, 'fourthPeriodTeacher': mondayList[7].text}, 
                   fifthPeriod: {'fifthPeriod': mondayList[8].text, 'fifthPeriodTeacher': mondayList[9].text}, 
                   sixthPeriod: {'sixthPeriod': mondayList[10].text, 'sixthPeriodTeacher': mondayList[11].text},
                    seventhPeriod: {'seventhPeriod': mondayList[12].text, 'seventhPeriodTeacher': mondayList[13].text},dayName: 'Monday'); 

                //tuesday timetable 
                MondayModel Tuesdaymodel = await MondayModel(firstPeriod: {'firstPeriod': tuesdayList[0].text, 'firstPeriodTeacher': tuesdayList[1].text},
                 secondPeriod: {'secondPeriod': tuesdayList[2].text, 'secondPeriodTeacher': tuesdayList[3].text},
                  thirdPeriod: {'thirdPeriod': tuesdayList[4].text, 'thirdPeriodTeacher': tuesdayList[5].text},
                   fouthPeriod: {'fourthPeriod': tuesdayList[6].text, 'fourthPeriodTeacher': tuesdayList[7].text}, 
                   fifthPeriod: {'fifthPeriod': tuesdayList[8].text, 'fifthPeriodTeacher': tuesdayList[9].text}, 
                   sixthPeriod: {'sixthPeriod': tuesdayList[10].text, 'sixthPeriodTeacher': tuesdayList[11].text},
                    seventhPeriod: {'seventhPeriod': tuesdayList[12].text, 'seventhPeriodTeacher': tuesdayList[13].text},dayName: 'Tuesday'); 

                //wednesday 
                 MondayModel Wednesdaymodel = await MondayModel(firstPeriod: {'firstPeriod': tuesdayList[0].text, 'firstPeriodTeacher': tuesdayList[1].text},
                 secondPeriod: {'secondPeriod': tuesdayList[2].text, 'secondPeriodTeacher': tuesdayList[3].text},
                  thirdPeriod: {'thirdPeriod': tuesdayList[4].text, 'thirdPeriodTeacher': tuesdayList[5].text},
                   fouthPeriod: {'fourthPeriod': tuesdayList[6].text, 'fourthPeriodTeacher': tuesdayList[7].text}, 
                   fifthPeriod: {'fifthPeriod': tuesdayList[8].text, 'fifthPeriodTeacher': tuesdayList[9].text}, 
                   sixthPeriod: {'sixthPeriod': tuesdayList[10].text, 'sixthPeriodTeacher': tuesdayList[11].text},
                    seventhPeriod: {'seventhPeriod': tuesdayList[12].text, 'seventhPeriodTeacher': tuesdayList[13].text},dayName: 'Wednesday'); 

                //thursday 
                 MondayModel Thursdaymodel = await MondayModel(firstPeriod: {'firstPeriod': tuesdayList[0].text, 'firstPeriodTeacher': tuesdayList[1].text},
                 secondPeriod: {'secondPeriod': tuesdayList[2].text, 'secondPeriodTeacher': tuesdayList[3].text},
                  thirdPeriod: {'thirdPeriod': tuesdayList[4].text, 'thirdPeriodTeacher': tuesdayList[5].text},
                   fouthPeriod: {'fourthPeriod': tuesdayList[6].text, 'fourthPeriodTeacher': tuesdayList[7].text}, 
                   fifthPeriod: {'fifthPeriod': tuesdayList[8].text, 'fifthPeriodTeacher': tuesdayList[9].text}, 
                   sixthPeriod: {'sixthPeriod': tuesdayList[10].text, 'sixthPeriodTeacher': tuesdayList[11].text},
                    seventhPeriod: {'seventhPeriod': tuesdayList[12].text, 'seventhPeriodTeacher': tuesdayList[13].text},dayName: 'Thursday');  

                //friday 
                 MondayModel Fridaymodel = await MondayModel(firstPeriod: {'firstPeriod': tuesdayList[0].text, 'firstPeriodTeacher': tuesdayList[1].text},
                 secondPeriod: {'secondPeriod': tuesdayList[2].text, 'secondPeriodTeacher': tuesdayList[3].text},
                  thirdPeriod: {'thirdPeriod': tuesdayList[4].text, 'thirdPeriodTeacher': tuesdayList[5].text},
                   fouthPeriod: {'fourthPeriod': tuesdayList[6].text, 'fourthPeriodTeacher': tuesdayList[7].text}, 
                   fifthPeriod: {'fifthPeriod': tuesdayList[8].text, 'fifthPeriodTeacher': tuesdayList[9].text}, 
                   sixthPeriod: {'sixthPeriod': tuesdayList[10].text, 'sixthPeriodTeacher': tuesdayList[11].text},
                    seventhPeriod: {'seventhPeriod': tuesdayList[12].text, 'seventhPeriodTeacher': tuesdayList[13].text},dayName: 'Friday'); 
                
                AddTimeTableToFirebase().AddTimeTablesToFirebase(widget.schoolID, widget.classID, Mondaymodel,Tuesdaymodel, Wednesdaymodel, Thursdaymodel, Fridaymodel );
               // Navigator.push(context, MaterialPageRoute(builder: ((context) => ShowTimeTable(k))));
              
              },
              child: Text(
                'Submit Timetable',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            )
          ],
        ),
        // body: Center(
        //   child: Container(
        //     height: 300,
        //     width: 300,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //        Padding(
        //          padding:  EdgeInsets.only(),
        //          child: TextField(
        //                 controller: numberOfPeriodsController,
        //                 decoration: InputDecoration(
        //                   filled: true,
        //                   fillColor: Colors.white,
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(15),
        //                     borderSide: BorderSide.none,
        //                   ),
        //                   hintStyle: TextStyle(fontSize: 19),
        //                   hintText: 'Enter the number of periods',
        //                 ),
        //                 style: TextStyle(fontSize: 19),
        //               ),
        //        ),
        //        sizedBoxH10,
        //        GestureDetector(
        //         onTap: (){
        //           Navigator.push(context, MaterialPageRoute(builder: ((context) => UploadTimetableScreen(numberOfPeriodsinString: numberOfPeriodsController.text,))));
        //         },
        //          child: ButtonContainerWidget(
        //                     curving: 30,
        //                     // ignore: sort_child_properties_last
        //                     child: Center(
        //                       child: Text("Done",
        //                           style: GoogleFont.subHeadTextStyle),
        //                     ),
        //                     colorindex: 7,
        //                     height: 50,
        //                     width: 100),
        //        ),
        //       ],
        //     ),
        //   ),
        // ),
        //   body: ListView(  //second
        //     shrinkWrap: true,
        //     physics: ScrollPhysics(),
        //     children: [
        //       Column(
        //         children: [
        //           sizedBoxH20,
        //           Text('Monday', style: TextStyle(fontSize: 20, color: Colors.white),), sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ), sizedBoxH20,
        //             SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ), sizedBoxH20,
        //             SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ), sizedBoxH20,
        //             SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),  sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),
        //           Text('Tuesday', style: TextStyle(fontSize: 20),),
        //            sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),
        //            sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),
        //            sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),
        //            sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),
        //            sizedBoxH20,
        //           SizedBox(
        //             height: 50,
        //             width: 200,
        //             child: TextField(
        //                    // controller: numberOfPeriodsController,
        //                     decoration: InputDecoration(
        //                       filled: true,
        //                       fillColor: Colors.white,
        //                       border: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(5),
        //                         borderSide: BorderSide.none,
        //                       ),
        //                       hintStyle: TextStyle(fontSize: 15),
        //                       hintText: '',
        //                     ),
        //                     style: TextStyle(fontSize: 19),
        //                   ),
        //           ),

        //         ],
        //       )
        //     ],
        //   ),
        // );
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                      color: Colors.brown,
                      child: periodListWidget( 'Monday', mondayList),),
                ),
                Flexible(
                  child: Container(
                    
                      color: Colors.orange, child:periodListWidget( 'Tuesday', tuesdayList)),
                ),
                Flexible(
                  child: Container(
                      color: Colors.green, child: periodListWidget( 'Wednesday',wednesdayList)),
                ),
                Flexible(
                  child: Container(
                      color: Colors.black, child: periodListWidget( 'Thursday',thursdayList)),
                ),
                Flexible(
                  child: Container(
                    color: Colors.red,
                    child: periodListWidget( 'Friday', fridayList),
                  ),
                ),
              ],
            ),
            // Positioned(
            //   bottom: 50,
            //   left: 50,
            //   right: 50,
            //   child: SizedBox(
            //     height: 100,
            //     child: ElevatedButton(onPressed: (){}, child: Text('Add Timetable', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),))),
            // )
          ],
        ));
  }

  // Widget ui_Widget(day) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: ListView(
  //       children: [
  //         Text(
  //           day,
  //           style: TextStyle(
  //               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  //         ),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'firstperiod', '', 'First Period',
  //             borderRadius: 10,
  //             textColor: Colors.white,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'secondperiod', '', 'Second Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'thirdperiod', '', 'Third Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'fourthperiod', '', 'Fourth Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             borderFocusColor: Colors.white,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         FormHelper.inputFieldWidgetWithLabel(
  //             context, 'fifthperiod', '', 'Fifth Period',
  //             textColor: Colors.white,
  //             borderRadius: 10,
  //             hintColor: Colors.white.withOpacity(0.5),
  //             borderFocusColor: Colors.white,
  //             borderColor: Colors.white, (onValidateVal) {
  //           if (onValidateVal.isBlank) {
  //             return 'Field can\'t be empty';
  //           } else {
  //             return null;
  //           }
  //         }, (onSavedVal) {}),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'sixthperiod', '', 'Sixth Period',
  //               textColor: Colors.white,
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'seventhperiod', '', 'Seventh Period',
  //               textColor: Colors.white,
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'eighthperiod', '', 'Eighth Period',
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         ),
  //         Visibility(
  //           visible: false,
  //           child: FormHelper.inputFieldWidgetWithLabel(
  //               context, 'nineth', '', 'Nineth Period',
  //               borderRadius: 10,
  //               hintColor: Colors.white.withOpacity(0.5),
  //               borderFocusColor: Colors.white,
  //               borderColor: Colors.white, (onValidateVal) {
  //             if (onValidateVal.isBlank) {
  //               return 'Field can\'t be empty';
  //             } else {
  //               return null;
  //             }
  //           }, (onSavedVal) {}),
  //         )
  //       ],
  //     ),
  //   );
  // }
}


    periodListWidget(String day, List<TextEditingController> contList){
    return Column(
      children: [ 
        SizedBox(height: 10,),
        Text(day ,style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),sizedBoxH10,
        ui_W('First Period', contList[0]), SizedBox(height: 0,),
        ui_W('First Period Teacher', contList[1]), sizedBoxH20,
        ui_W('Second Period', contList[2]), SizedBox(height: 0,),
        ui_W('Second Period Teacher', contList[3]), sizedBoxH20,
        ui_W('Third Period', contList[4]), SizedBox(height: 0,),
        ui_W('Third Period Teacher', contList[5]), sizedBoxH20,
        ui_W('Fourth Period', contList[6]), SizedBox(height: 0,),
        ui_W('Fourth Period Teacher', contList[7]), sizedBoxH20,
        ui_W('Fifth Period', contList[8]), SizedBox(height: 0,),
        ui_W('Fifth Period Teacher', contList[9]), sizedBoxH20, 
        ui_W('Sixth Period', contList[10]), SizedBox(height: 0,),
        ui_W('Sixth Period Teacher', contList[11]), sizedBoxH20,
        ui_W('Seventh Period', contList[12]), SizedBox(height: 0,),
        ui_W('Seventh Period Teacher', contList[13]), 

      ],
    );
}

ui_W(String text, TextEditingController cont) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, right: 25, ),
    child: SizedBox( 
      height: 36,
      child: TextField( 
        controller: cont,
        decoration: InputDecoration(

            hintText: text,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)), 
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white))),
      ),
    ),
  );
}
