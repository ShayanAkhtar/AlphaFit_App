import 'package:flutter/material.dart';
import 'package:alphafitness/ChestWorkout.dart';
import 'package:alphafitness/ScheduleScreen.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'BackWorkout.dart';
import 'LegsWorkout.dart';
import 'ShouldeWorkout.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class legs_schedule extends StatefulWidget {
  const legs_schedule({Key? key}) : super(key: key);

  @override
  State<legs_schedule> createState() => _legs_scheduleState();
}

class _legs_scheduleState extends State<legs_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final legpresssetsController=TextEditingController();
  final legpressrepsController=TextEditingController();
  final legpressweightController=TextEditingController();


  final squatssetsController=TextEditingController();
  final squatsrepsController=TextEditingController();
  final squatsweightController=TextEditingController();


  final lungessetsController=TextEditingController();
  final lungesrepsController=TextEditingController();
  final lungesweightController=TextEditingController();

  final legextensionsetsController=TextEditingController();
  final legextensionrepsController=TextEditingController();
  final legextensionweightController=TextEditingController();


  final calvessetsController=TextEditingController();
  final calvesrepsController=TextEditingController();
  final calvesweightController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(

                'LEGS',style: TextStyle(color: Colors.red),),
            ),
            SizedBox(
              width: 8,
            ),
            Text('WORKOUTS',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>legs_workout()));
          }, icon: Icon(Icons.help))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 53.0,
        color: Colors.black26,
        child: IconButton(
          padding: EdgeInsets.only(left: getwidth(context)*0.05),
          alignment: Alignment.centerLeft,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.red,
            size: 27.0,
          ),

        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                width: getwidth(context),
                height: getheight(context)*0.16,

                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text('Leg Press',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/legpress.png"),
                              radius: 35,
                            ),
                            margin: EdgeInsets.only(top: getheight(context)*0.01,right: getwidth(context)*0.05),
                          ),
                        ],
                      ),
                      // SizedBox(height: getheight(context)*0.03,),
                      IconButton(
                        onPressed: (){
                          showModalBottomSheet(

                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context){
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    width: getwidth(context),
                                    height: getheight(context)*0.9,
                                    child:
                                    SingleChildScrollView(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Track Your Workout',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(left: 15,top: 20),
                                                width: getwidth(context)*0.4,
                                                height: getheight(context)*0.05,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25.0,
                                                  color: Colors.white,

                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: getwidth(context),
                                            height: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            child: Row(
                                                children: [
                                                  Container(

                                                    child: Text('Weight : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white10,
                                                    ),
                                                    width: getwidth(context) * 0.18,
                                                    height: getheight(context) * 0.07,


                                                    child:
                                                    FirebaseAnimatedList(
                                                      query: ref.orderByChild('Email').equalTo(
                                                          _auth.currentUser?.email.toString()),
                                                      itemBuilder: (context, snapshot, animation,
                                                          index) {
                                                        return Container(
                                                          width: getwidth(context) * 0.17,
                                                          height: getheight(context)*0.07,
                                                          child: Center(
                                                            child: TextField(
                                                              cursorColor: Colors.red,
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20
                                                              ),
                                                              controller: legpressweightController,
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        color: Colors.white,
                                                                      )
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors.red,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },

                                                    ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                                                  SizedBox(width: getwidth(context)*0.02,),
                                                  Container(
                                                      margin:EdgeInsets.only(
                                                          right: getwidth(context)*0.05),child: Text(
                                                    'kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                                ]),
                                            margin: EdgeInsets.only(top: getheight(context)*0.01),
                                          ),
                                          SizedBox(height: getheight(context)*0.02,),
                                          Row(
                                              children: [
                                                Container(

                                                  child: Text('Sets : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.white10,
                                                  ),
                                                  width: getwidth(context) * 0.18,
                                                  height: getheight(context) * 0.07,


                                                  child:
                                                  FirebaseAnimatedList(
                                                    query: ref.orderByChild('Email').equalTo(
                                                        _auth.currentUser?.email.toString()),
                                                    itemBuilder: (context, snapshot, animation,
                                                        index) {
                                                      return Container(
                                                        width: getwidth(context) * 0.17,
                                                        height: getheight(context)*0.07,
                                                        child: Center(
                                                          child: TextField(
                                                            cursorColor: Colors.red,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20
                                                            ),
                                                            controller: legpresssetsController,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      width: 2,
                                                                      color: Colors.red,
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                SizedBox(width: getwidth(context)*0.02,),
                                                Row(
                                                    children: [
                                                      Container(

                                                        child: Text('Reps : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white10,
                                                        ),
                                                        width: getwidth(context) * 0.18,
                                                        height: getheight(context) * 0.07,


                                                        child:
                                                        FirebaseAnimatedList(
                                                          query: ref.orderByChild('Email').equalTo(
                                                              _auth.currentUser?.email.toString()),
                                                          itemBuilder: (context, snapshot, animation,
                                                              index) {
                                                            return Container(
                                                              width: getwidth(context) * 0.17,
                                                              height: getheight(context)*0.07,
                                                              child: Center(
                                                                child: TextField(
                                                                  cursorColor: Colors.red,
                                                                  keyboardType: TextInputType.number,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20
                                                                  ),
                                                                  controller: legpressrepsController,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.white,
                                                                          )
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            width: 2,
                                                                            color: Colors.red,
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                        ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                      SizedBox(width: getwidth(context)*0.02,),
                                                    ]),

                                              ]),

                                          SizedBox(height: getheight(context)*0.02,),
                                          InkWell(

                                            child: Container(
                                              width: getwidth(context),
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: getheight(context)*0.2),
                                            ),
                                            onTap: (){
                                              if(legpressweightController.text.toString().isEmpty || legpresssetsController.text.toString().isEmpty || legpressrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Leg Press weights': legpressweightController
                                                      .text.toString(),
                                                  'Leg Press sets': legpresssetsController
                                                      .text.toString(),
                                                  'Legs Press reps': legpressrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  legpressweightController.clear();
                                                  legpresssetsController.clear();
                                                  legpressrepsController.clear();
                                                  Navigator.pop(context);
                                                }).onError((error,
                                                    stackTrace) {
                                                  toast(error.toString());
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              }
                          );
                        },
                        icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 30,),
                      ),

                    ]),
              ),
              SizedBox(height: getheight(context)*0.02,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                width: getwidth(context),
                height: getheight(context)*0.16,

                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text('Weighted Squats',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/squat.png"),
                              radius: 35,
                            ),
                            margin: EdgeInsets.only(top: getheight(context)*0.01,right: getwidth(context)*0.05),
                          ),
                        ],
                      ),
                      // SizedBox(height: getheight(context)*0.03,),
                      IconButton(
                        onPressed: (){
                          showModalBottomSheet(

                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context){
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    width: getwidth(context),
                                    height: getheight(context)*0.9,
                                    child:
                                    SingleChildScrollView(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Track Your Workout',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(left: 15,top: 20),
                                                width: getwidth(context)*0.4,
                                                height: getheight(context)*0.05,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25.0,
                                                  color: Colors.white,

                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: getwidth(context),
                                            height: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            child: Row(
                                                children: [
                                                  Container(

                                                    child: Text('Weight : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white10,
                                                    ),
                                                    width: getwidth(context) * 0.18,
                                                    height: getheight(context) * 0.07,


                                                    child:
                                                    FirebaseAnimatedList(
                                                      query: ref.orderByChild('Email').equalTo(
                                                          _auth.currentUser?.email.toString()),
                                                      itemBuilder: (context, snapshot, animation,
                                                          index) {
                                                        return Container(
                                                          width: getwidth(context) * 0.17,
                                                          height: getheight(context)*0.07,
                                                          child: Center(
                                                            child: TextField(
                                                              cursorColor: Colors.red,
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20
                                                              ),
                                                              controller: squatsweightController,
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        color: Colors.white,
                                                                      )
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors.red,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },

                                                    ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                                                  SizedBox(width: getwidth(context)*0.02,),
                                                  Container(
                                                      margin:EdgeInsets.only(
                                                          right: getwidth(context)*0.05),child: Text(
                                                    'kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                                ]),
                                            margin: EdgeInsets.only(top: getheight(context)*0.01),
                                          ),
                                          SizedBox(height: getheight(context)*0.02,),
                                          Row(
                                              children: [
                                                Container(

                                                  child: Text('Sets : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.white10,
                                                  ),
                                                  width: getwidth(context) * 0.18,
                                                  height: getheight(context) * 0.07,


                                                  child:
                                                  FirebaseAnimatedList(
                                                    query: ref.orderByChild('Email').equalTo(
                                                        _auth.currentUser?.email.toString()),
                                                    itemBuilder: (context, snapshot, animation,
                                                        index) {
                                                      return Container(
                                                        width: getwidth(context) * 0.17,
                                                        height: getheight(context)*0.07,
                                                        child: Center(
                                                          child: TextField(
                                                            cursorColor: Colors.red,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20
                                                            ),
                                                            controller:squatssetsController,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      width: 2,
                                                                      color: Colors.red,
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                SizedBox(width: getwidth(context)*0.02,),
                                                Row(
                                                    children: [
                                                      Container(

                                                        child: Text('Reps : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white10,
                                                        ),
                                                        width: getwidth(context) * 0.18,
                                                        height: getheight(context) * 0.07,


                                                        child:
                                                        FirebaseAnimatedList(
                                                          query: ref.orderByChild('Email').equalTo(
                                                              _auth.currentUser?.email.toString()),
                                                          itemBuilder: (context, snapshot, animation,
                                                              index) {
                                                            return Container(
                                                              width: getwidth(context) * 0.17,
                                                              height: getheight(context)*0.07,
                                                              child: Center(
                                                                child: TextField(
                                                                  cursorColor: Colors.red,
                                                                  keyboardType: TextInputType.number,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20
                                                                  ),
                                                                  controller: squatsrepsController,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.white,
                                                                          )
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            width: 2,
                                                                            color: Colors.red,
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                        ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                      SizedBox(width: getwidth(context)*0.02,),
                                                    ]),

                                              ]),

                                          SizedBox(height: getheight(context)*0.02,),
                                          InkWell(

                                            child: Container(
                                              width: getwidth(context),
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: getheight(context)*0.2),
                                            ),
                                            onTap: (){
                                              if(squatsweightController.text.toString().isEmpty || squatssetsController.text.toString().isEmpty || squatsrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Squats weights': squatsweightController
                                                      .text.toString(),
                                                  'Squats sets': squatssetsController
                                                      .text.toString(),
                                                  'Squats reps': squatsrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  squatsweightController.clear();
                                                  squatssetsController.clear();
                                                  squatsrepsController.clear();
                                                  Navigator.pop(context);
                                                }).onError((error,
                                                    stackTrace) {
                                                  toast(error.toString());
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              }
                          );
                        },
                        icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 30,),
                      ),

                    ]),
              ),
              SizedBox(height: getheight(context)*0.02,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                width: getwidth(context),
                height: getheight(context)*0.16,

                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text('Barbell Front Lunges',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/lunges.png"),
                              radius: 35,
                            ),
                            margin: EdgeInsets.only(top: getheight(context)*0.01,right: getwidth(context)*0.05),
                          ),
                        ],
                      ),
                      // SizedBox(height: getheight(context)*0.03,),
                      IconButton(
                        onPressed: (){
                          showModalBottomSheet(

                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context){
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    width: getwidth(context),
                                    height: getheight(context)*0.9,
                                    child:
                                    SingleChildScrollView(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Track Your Workout',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(left: 15,top: 20),
                                                width: getwidth(context)*0.4,
                                                height: getheight(context)*0.05,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25.0,
                                                  color: Colors.white,

                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: getwidth(context),
                                            height: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            child: Row(
                                                children: [
                                                  Container(

                                                    child: Text('Weight : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white10,
                                                    ),
                                                    width: getwidth(context) * 0.18,
                                                    height: getheight(context) * 0.07,


                                                    child:
                                                    FirebaseAnimatedList(
                                                      query: ref.orderByChild('Email').equalTo(
                                                          _auth.currentUser?.email.toString()),
                                                      itemBuilder: (context, snapshot, animation,
                                                          index) {
                                                        return Container(
                                                          width: getwidth(context) * 0.17,
                                                          height: getheight(context)*0.07,
                                                          child: Center(
                                                            child: TextField(
                                                              cursorColor: Colors.red,
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20
                                                              ),
                                                              controller: lungesweightController,
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        color: Colors.white,
                                                                      )
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors.red,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },

                                                    ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                                                  SizedBox(width: getwidth(context)*0.02,),
                                                  Container(
                                                      margin:EdgeInsets.only(
                                                          right: getwidth(context)*0.05),child: Text(
                                                    'kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                                ]),
                                            margin: EdgeInsets.only(top: getheight(context)*0.01),
                                          ),
                                          SizedBox(height: getheight(context)*0.02,),
                                          Row(
                                              children: [
                                                Container(

                                                  child: Text('Sets : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.white10,
                                                  ),
                                                  width: getwidth(context) * 0.18,
                                                  height: getheight(context) * 0.07,


                                                  child:
                                                  FirebaseAnimatedList(
                                                    query: ref.orderByChild('Email').equalTo(
                                                        _auth.currentUser?.email.toString()),
                                                    itemBuilder: (context, snapshot, animation,
                                                        index) {
                                                      return Container(
                                                        width: getwidth(context) * 0.17,
                                                        height: getheight(context)*0.07,
                                                        child: Center(
                                                          child: TextField(
                                                            cursorColor: Colors.red,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20
                                                            ),
                                                            controller: lungessetsController,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      width: 2,
                                                                      color: Colors.red,
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                SizedBox(width: getwidth(context)*0.02,),
                                                Row(
                                                    children: [
                                                      Container(

                                                        child: Text('Reps : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white10,
                                                        ),
                                                        width: getwidth(context) * 0.18,
                                                        height: getheight(context) * 0.07,


                                                        child:
                                                        FirebaseAnimatedList(
                                                          query: ref.orderByChild('Email').equalTo(
                                                              _auth.currentUser?.email.toString()),
                                                          itemBuilder: (context, snapshot, animation,
                                                              index) {
                                                            return Container(
                                                              width: getwidth(context) * 0.17,
                                                              height: getheight(context)*0.07,
                                                              child: Center(
                                                                child: TextField(
                                                                  cursorColor: Colors.red,
                                                                  keyboardType: TextInputType.number,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20
                                                                  ),
                                                                  controller: lungesrepsController,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.white,
                                                                          )
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            width: 2,
                                                                            color: Colors.red,
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                        ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                      SizedBox(width: getwidth(context)*0.02,),
                                                    ]),

                                              ]),

                                          SizedBox(height: getheight(context)*0.02,),
                                          InkWell(

                                            child: Container(
                                              width: getwidth(context),
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: getheight(context)*0.2),
                                            ),
                                            onTap: (){
                                              if(lungesweightController.text.toString().isEmpty || lungessetsController.text.toString().isEmpty || lungesrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Lunges weights': lungesweightController
                                                      .text.toString(),
                                                  'Lunges sets': lungessetsController
                                                      .text.toString(),
                                                  'Lunges reps': lungesrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  lungesweightController.clear();
                                                  lungessetsController.clear();
                                                  lungesrepsController.clear();
                                                  Navigator.pop(context);
                                                }).onError((error,
                                                    stackTrace) {
                                                  toast(error.toString());
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              }
                          );
                        },
                        icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 30,),
                      ),

                    ]),
              ),
              SizedBox(height: getheight(context)*0.02,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                width: getwidth(context),
                height: getheight(context)*0.16,

                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text('Leg Extension',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/legextension.png"),
                              radius: 35,
                            ),
                            margin: EdgeInsets.only(top: getheight(context)*0.01,right: getwidth(context)*0.05),
                          ),
                        ],
                      ),
                      // SizedBox(height: getheight(context)*0.03,),
                      IconButton(
                        onPressed: (){
                          showModalBottomSheet(

                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context){
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    width: getwidth(context),
                                    height: getheight(context)*0.9,
                                    child:
                                    SingleChildScrollView(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Track Your Workout',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(left: 15,top: 20),
                                                width: getwidth(context)*0.4,
                                                height: getheight(context)*0.05,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25.0,
                                                  color: Colors.white,

                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: getwidth(context),
                                            height: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            child: Row(
                                                children: [
                                                  Container(

                                                    child: Text('Weight : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white10,
                                                    ),
                                                    width: getwidth(context) * 0.18,
                                                    height: getheight(context) * 0.07,


                                                    child:
                                                    FirebaseAnimatedList(
                                                      query: ref.orderByChild('Email').equalTo(
                                                          _auth.currentUser?.email.toString()),
                                                      itemBuilder: (context, snapshot, animation,
                                                          index) {
                                                        return Container(
                                                          width: getwidth(context) * 0.17,
                                                          height: getheight(context)*0.07,
                                                          child: Center(
                                                            child: TextField(
                                                              cursorColor: Colors.red,
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20
                                                              ),
                                                              controller: legextensionweightController,
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        color: Colors.white,
                                                                      )
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors.red,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },

                                                    ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                                                  SizedBox(width: getwidth(context)*0.02,),
                                                  Container(
                                                      margin:EdgeInsets.only(
                                                          right: getwidth(context)*0.05),child: Text(
                                                    'kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                                ]),
                                            margin: EdgeInsets.only(top: getheight(context)*0.01),
                                          ),
                                          SizedBox(height: getheight(context)*0.02,),
                                          Row(
                                              children: [
                                                Container(

                                                  child: Text('Sets : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.white10,
                                                  ),
                                                  width: getwidth(context) * 0.18,
                                                  height: getheight(context) * 0.07,


                                                  child:
                                                  FirebaseAnimatedList(
                                                    query: ref.orderByChild('Email').equalTo(
                                                        _auth.currentUser?.email.toString()),
                                                    itemBuilder: (context, snapshot, animation,
                                                        index) {
                                                      return Container(
                                                        width: getwidth(context) * 0.17,
                                                        height: getheight(context)*0.07,
                                                        child: Center(
                                                          child: TextField(
                                                            cursorColor: Colors.red,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20
                                                            ),
                                                            controller: legextensionsetsController,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      width: 2,
                                                                      color: Colors.red,
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                SizedBox(width: getwidth(context)*0.02,),
                                                Row(
                                                    children: [
                                                      Container(

                                                        child: Text('Reps : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white10,
                                                        ),
                                                        width: getwidth(context) * 0.18,
                                                        height: getheight(context) * 0.07,


                                                        child:
                                                        FirebaseAnimatedList(
                                                          query: ref.orderByChild('Email').equalTo(
                                                              _auth.currentUser?.email.toString()),
                                                          itemBuilder: (context, snapshot, animation,
                                                              index) {
                                                            return Container(
                                                              width: getwidth(context) * 0.17,
                                                              height: getheight(context)*0.07,
                                                              child: Center(
                                                                child: TextField(
                                                                  cursorColor: Colors.red,
                                                                  keyboardType: TextInputType.number,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20
                                                                  ),
                                                                  controller: legextensionrepsController,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.white,
                                                                          )
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            width: 2,
                                                                            color: Colors.red,
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                        ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                      SizedBox(width: getwidth(context)*0.02,),
                                                    ]),

                                              ]),

                                          SizedBox(height: getheight(context)*0.02,),
                                          InkWell(

                                            child: Container(
                                              width: getwidth(context),
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: getheight(context)*0.2),
                                            ),
                                            onTap: (){
                                              if(legextensionweightController.text.toString().isEmpty || legextensionsetsController.text.toString().isEmpty || legextensionrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Legs Extension weights': legextensionweightController
                                                      .text.toString(),
                                                  'Legs Extension sets': legextensionsetsController
                                                      .text.toString(),
                                                  'legs Extension reps': legextensionrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  legextensionweightController.clear();
                                                  legextensionsetsController.clear();
                                                  legextensionrepsController.clear();
                                                  Navigator.pop(context);
                                                }).onError((error,
                                                    stackTrace) {
                                                  toast(error.toString());
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              }
                          );
                        },
                        icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 30,),
                      ),

                    ]),
              ),
              SizedBox(height: getheight(context)*0.02,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10,
                ),
                width: getwidth(context),
                height: getheight(context)*0.16,

                child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text('Calve Raises',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/calve.png"),
                              radius: 35,
                            ),
                            margin: EdgeInsets.only(top: getheight(context)*0.01,right: getwidth(context)*0.05),
                          ),
                        ],
                      ),
                      // SizedBox(height: getheight(context)*0.03,),
                      IconButton(
                        onPressed: (){
                          showModalBottomSheet(

                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context){
                                return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    width: getwidth(context),
                                    height: getheight(context)*0.9,
                                    child:
                                    SingleChildScrollView(
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                  'Track Your Workout',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                margin: EdgeInsets.only(left: 15,top: 20),
                                                width: getwidth(context)*0.4,
                                                height: getheight(context)*0.05,
                                              ),
                                              Spacer(),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 25.0,
                                                  color: Colors.white,

                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ),
                                          Container(
                                            width: getwidth(context),
                                            height: 1,
                                            color: Colors.white,
                                          ),
                                          Container(
                                            child: Row(
                                                children: [
                                                  Container(

                                                    child: Text('Weight : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                    margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color: Colors.white10,
                                                    ),
                                                    width: getwidth(context) * 0.18,
                                                    height: getheight(context) * 0.07,


                                                    child:
                                                    FirebaseAnimatedList(
                                                      query: ref.orderByChild('Email').equalTo(
                                                          _auth.currentUser?.email.toString()),
                                                      itemBuilder: (context, snapshot, animation,
                                                          index) {
                                                        return Container(
                                                          width: getwidth(context) * 0.17,
                                                          height: getheight(context)*0.07,
                                                          child: Center(
                                                            child: TextField(
                                                              cursorColor: Colors.red,
                                                              keyboardType: TextInputType.number,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 20
                                                              ),
                                                              controller: calvesweightController,
                                                              decoration: InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        color: Colors.white,
                                                                      )
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors.red,
                                                                      )
                                                                  )
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },

                                                    ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                                                  SizedBox(width: getwidth(context)*0.02,),
                                                  Container(
                                                      margin:EdgeInsets.only(
                                                          right: getwidth(context)*0.05),child: Text(
                                                    'kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                                                ]),
                                            margin: EdgeInsets.only(top: getheight(context)*0.01),
                                          ),
                                          SizedBox(height: getheight(context)*0.02,),
                                          Row(
                                              children: [
                                                Container(

                                                  child: Text('Sets : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(15),
                                                    color: Colors.white10,
                                                  ),
                                                  width: getwidth(context) * 0.18,
                                                  height: getheight(context) * 0.07,


                                                  child:
                                                  FirebaseAnimatedList(
                                                    query: ref.orderByChild('Email').equalTo(
                                                        _auth.currentUser?.email.toString()),
                                                    itemBuilder: (context, snapshot, animation,
                                                        index) {
                                                      return Container(
                                                        width: getwidth(context) * 0.17,
                                                        height: getheight(context)*0.07,
                                                        child: Center(
                                                          child: TextField(
                                                            cursorColor: Colors.red,
                                                            keyboardType: TextInputType.number,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20
                                                            ),
                                                            controller: calvessetsController,
                                                            decoration: InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      width: 2,
                                                                      color: Colors.red,
                                                                    )
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },

                                                  ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                SizedBox(width: getwidth(context)*0.02,),
                                                Row(
                                                    children: [
                                                      Container(

                                                        child: Text('Reps : ',style: TextStyle(color: Colors.white,fontSize: 20),),
                                                        margin: EdgeInsets.only(left: getwidth(context)*0.04),),

                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white10,
                                                        ),
                                                        width: getwidth(context) * 0.18,
                                                        height: getheight(context) * 0.07,


                                                        child:
                                                        FirebaseAnimatedList(
                                                          query: ref.orderByChild('Email').equalTo(
                                                              _auth.currentUser?.email.toString()),
                                                          itemBuilder: (context, snapshot, animation,
                                                              index) {
                                                            return Container(
                                                              width: getwidth(context) * 0.17,
                                                              height: getheight(context)*0.07,
                                                              child: Center(
                                                                child: TextField(
                                                                  cursorColor: Colors.red,
                                                                  keyboardType: TextInputType.number,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 20
                                                                  ),
                                                                  controller: calvesrepsController,
                                                                  decoration: InputDecoration(
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.white,
                                                                          )
                                                                      ),
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                            color: Colors.red,
                                                                          )
                                                                      )
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                        ),margin: EdgeInsets.only(left: getwidth(context)*0.09),),
                                                      SizedBox(width: getwidth(context)*0.02,),
                                                    ]),

                                              ]),

                                          SizedBox(height: getheight(context)*0.02,),
                                          InkWell(

                                            child: Container(
                                              width: getwidth(context),
                                              height: 55,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: getheight(context)*0.2),
                                            ),
                                            onTap: (){
                                              if(calvesweightController.text.toString().isEmpty || calvessetsController.text.toString().isEmpty || calvesrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Calve Raises weights': calvesweightController
                                                      .text.toString(),
                                                  'Calve Raises sets': calvessetsController
                                                      .text.toString(),
                                                  'Calve Raises reps': calvesrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  calvesweightController.clear();
                                                  calvessetsController.clear();
                                                  calvesrepsController.clear();
                                                  Navigator.pop(context);
                                                }).onError((error,
                                                    stackTrace) {
                                                  toast(error.toString());
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                              }
                          );
                        },
                        icon: Icon(Icons.add_circle_rounded,color: Colors.white,size: 30,),
                      ),

                    ]),
              ),
            ]
        ),
      ),
    );
  }
}
