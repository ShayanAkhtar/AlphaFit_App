import 'package:alphafitness/ChestWorkout.dart';
import 'package:alphafitness/ScheduleScreen.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'Armsworkout.dart';
import 'BackWorkout.dart';
import 'ShouldeWorkout.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class arms_schedule extends StatefulWidget {
  const arms_schedule({Key? key}) : super(key: key);

  @override
  State<arms_schedule> createState() => _arms_scheduleState();
}

class _arms_scheduleState extends State<arms_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final cablebicepsetsController=TextEditingController();
  final cablebiceprepsController=TextEditingController();
  final cablebicepweightController=TextEditingController();


  final dumbellbicepsetsController=TextEditingController();
  final dumbellbiceprepsController=TextEditingController();
  final dumbellbicepweightController=TextEditingController();


  final barbellcurlsetsController=TextEditingController();
  final barbellcurlrepsController=TextEditingController();
  final barbellcurlweightController=TextEditingController();

  final machinedipssetsController=TextEditingController();
  final machinedipsrepsController=TextEditingController();
  final machinedipsweightController=TextEditingController();


  final benchdipssetsController=TextEditingController();
  final benchdipsrepsController=TextEditingController();
  final benchdipsweightController=TextEditingController();
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

                'ARMS',style: TextStyle(color: Colors.red),),
            ),
            SizedBox(
              width: 8,
            ),
            Text('WORKOUTS',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>arms_workout()));
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
                            child: Text('Cable Bicep Curl',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/cablecurl.png"),
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
                                                              controller: cablebicepweightController,
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
                                                            controller: cablebicepsetsController,
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
                                                                  controller: cablebiceprepsController,
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
                                              if(cablebicepweightController.text.toString().isEmpty || cablebicepsetsController.text.toString().isEmpty || cablebiceprepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Cable Bicep weights': cablebicepweightController
                                                      .text.toString(),
                                                  'Cable Bicep sets': cablebicepsetsController
                                                      .text.toString(),
                                                  'Cable Bicep reps': cablebiceprepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  cablebicepweightController.clear();
                                                  cablebicepsetsController.clear();
                                                  cablebiceprepsController.clear();
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
                            child: Text('Dumbbell Bicep Curl',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/bicepscurl.png"),
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
                                                              controller: dumbellbicepweightController,
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
                                                            controller:dumbellbicepsetsController,
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
                                                                  controller: dumbellbiceprepsController,
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
                                              if(dumbellbicepweightController.text.toString().isEmpty || dumbellbicepsetsController.text.toString().isEmpty || dumbellbiceprepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Dumbbell Curl weights': dumbellbicepweightController
                                                      .text.toString(),
                                                  'Dumbbell Curl sets': dumbellbicepsetsController
                                                      .text.toString(),
                                                  'Dumbbell Curl reps': dumbellbiceprepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  dumbellbicepweightController.clear();
                                                  dumbellbicepsetsController.clear();
                                                  dumbellbiceprepsController.clear();
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
                            child: Text('Seated Barbell Curl',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/barbellseated.png"),
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
                                                              controller: barbellcurlweightController,
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
                                                            controller: barbellcurlsetsController,
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
                                                                  controller: barbellcurlrepsController,
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
                                              if(barbellcurlweightController.text.toString().isEmpty || barbellcurlsetsController.text.toString().isEmpty || barbellcurlrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Barbell Curl weights': barbellcurlweightController
                                                      .text.toString(),
                                                  'Barbell Curl sets': barbellcurlsetsController
                                                      .text.toString(),
                                                  'Barbell Curl reps': barbellcurlrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  barbellcurlweightController.clear();
                                                  barbellcurlsetsController.clear();
                                                  barbellcurlrepsController.clear();
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
                            child: Text('Triceps Dips Machine',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/dipsmachine.png"),
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
                                                              controller: machinedipsweightController,
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
                                                            controller: machinedipssetsController,
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
                                                                  controller: machinedipsrepsController,
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
                                              if(machinedipsweightController.text.toString().isEmpty || machinedipssetsController.text.toString().isEmpty || machinedipsrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Machine Dips weights': machinedipsweightController
                                                      .text.toString(),
                                                  'Machine Dips sets': machinedipssetsController
                                                      .text.toString(),
                                                  'Machine Dips reps': machinedipsrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  machinedipsweightController.clear();
                                                  machinedipssetsController.clear();
                                                  machinedipsrepsController.clear();
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
                            child: Text('Bench Tricpes Dips',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/benchdips.png"),
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
                                                              controller: benchdipsweightController,
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
                                                            controller: benchdipssetsController,
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
                                                                  controller: benchdipsrepsController,
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
                                              if(benchdipsweightController.text.toString().isEmpty || benchdipssetsController.text.toString().isEmpty || benchdipsrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Bench Dips weights': benchdipsweightController
                                                      .text.toString(),
                                                  'Bench Dips sets': benchdipssetsController
                                                      .text.toString(),
                                                  'Bench Dips reps': benchdipsrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  benchdipsweightController.clear();
                                                  benchdipssetsController.clear();
                                                  benchdipsrepsController.clear();
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
