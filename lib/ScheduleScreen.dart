import 'package:alphafitness/BackSchedule.dart';
import 'package:alphafitness/ChestSChedule.dart';
import 'package:alphafitness/ShoulderSchedule.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'ArmsSchedule.dart';
import 'LegsSchedule.dart';
import 'AbsSchedule.dart';
import 'set_height_and_width.dart';
class schedule_screen extends StatefulWidget {
  const schedule_screen({Key? key}) : super(key: key);

  @override
  State<schedule_screen> createState() => _schedule_screenState();
}

class _schedule_screenState extends State<schedule_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              child: Text(

                'CHOOSE',style: TextStyle(color: Colors.red,fontFamily: "BebasNeue",letterSpacing: 1,fontSize: 27),),
            ),
            SizedBox(
              width: 8,
            ),
            Text('WORKOUT',style: TextStyle(color: Colors.white,fontFamily: "BebasNeue",letterSpacing: 1,fontSize: 27),),
          ],
        ),
      ),

   body: SingleChildScrollView(
     child: Column(
       children: [
         SizedBox(
           height: getheight(context)*0.05,
         ),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>chest_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/chestworkout.jpg"),
                 fit: BoxFit.cover,
               ),
               borderRadius: BorderRadius.circular(20),
               color: Colors.white10

             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'CHEST WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                   margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('5 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
         SizedBox(height: getheight(context)*0.01,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>back_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/backworkout.jpg"),
                 fit: BoxFit.cover,
               ),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white10
             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'BACK WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('5 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
         SizedBox(height: getheight(context)*0.01,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>shoulder_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/images/shoulderworkout.jpg"),
                   fit: BoxFit.cover,
                 ),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white10
             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'SHOULDER WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('5 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
         SizedBox(height: getheight(context)*0.01,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>arms_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/armsworkout.jpg"),
                 fit: BoxFit.cover,
               ),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white10
             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'ARMS WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('4 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
         SizedBox(height: getheight(context)*0.01,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>legs_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/images/legsworkout.jpg"),
                   fit: BoxFit.cover,
                 ),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white10
             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'LEGS WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('5 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
         SizedBox(height: getheight(context)*0.01,),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>abs_schedule()));
           },
           child: Container(
             decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/images/absworkout.jpg"),
                   fit: BoxFit.cover,
                 ),
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white10
             ),
             margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03,bottom: getheight(context)*0.05),
             width: getwidth(context),
             height: getheight(context)*0.17,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   child: Text(
                     'ABS WORKOUT',
                     style: TextStyle(
                       letterSpacing: 0.5,
                       fontFamily: 'Kanit',
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.05),
                 ),
                 Container(
                     margin: EdgeInsets.only(left: getwidth(context)*0.05,bottom: getheight(context)*0.1),
                     child: Text('3 Exercises',style: TextStyle(color: Colors.white70),))

               ],
             ),
           ),
         ),
       ],
     ),
   ),
    );
  }
}
