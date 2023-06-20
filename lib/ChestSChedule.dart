import 'package:alphafitness/ChestWorkout.dart';
import 'package:alphafitness/ScheduleScreen.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class chest_schedule extends StatefulWidget {
  const chest_schedule({Key? key}) : super(key: key);

  @override
  State<chest_schedule> createState() => _chest_scheduleState();
}

class _chest_scheduleState extends State<chest_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final inclinesetsController=TextEditingController();
  final inclinerepsController=TextEditingController();
  final inclineweightController=TextEditingController();
  final flatsetsController=TextEditingController();
  final flatrepsController=TextEditingController();
  final flatweightController=TextEditingController();
  final declinesetsController=TextEditingController();
  final declinerepsController=TextEditingController();
  final declineweightController=TextEditingController();
  final machinesetsController=TextEditingController();
  final machinerepsController=TextEditingController();
  final machineweightController=TextEditingController();
  final dipssetsController=TextEditingController();
  final dipsrepsController=TextEditingController();
  final dipsweightController=TextEditingController();


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

                'CHEST',style: TextStyle(color: Colors.red),),
            ),
            SizedBox(
              width: 8,
            ),
            Text('WORKOUTS',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>chest_workout()));
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
            Container(
              margin: EdgeInsets.only(right: getwidth(context)*0.035),
              alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>chesthistory()));
                    }, child: Text('History',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))),
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
                          child: Text('Incline bench press',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                      Spacer(),
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/cap1.png"),
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
                                                                controller: inclineweightController,
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
                                                  controller: inclinesetsController,
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
                                                        controller: inclinerepsController,
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
                                                if(inclineweightController.text.toString().isEmpty || inclinesetsController.text.toString().isEmpty || inclinerepsController.text.toString().isEmpty  ){
                                                  toast('All Fields are required');
                                                }
                                                else {
                                                  ref.child(
                                                      UserRecords().Userid
                                                          .toString())
                                                      .update({
                                                    'incline bench press weights': inclineweightController
                                                        .text.toString(),
                                                    'incline bench press sets': inclinesetsController
                                                        .text.toString(),
                                                    'incline bench press reps': inclinerepsController
                                                        .text.toString(),
                                                  })
                                                      .then((value) {
                                                    toast('Workout Tracked');
                                                    inclineweightController.clear();
                                                    inclinesetsController.clear();
                                                    inclinerepsController.clear();
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
                          child: Text('Flat bench press',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                        Spacer(),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images/cap2.png"),
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
                                                            controller: flatweightController,
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
                                                          controller:flatsetsController,
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
                                                                controller: flatrepsController,
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
                                            if(flatweightController.text.toString().isEmpty || flatsetsController.text.toString().isEmpty || flatrepsController.text.toString().isEmpty  ){
                                              toast('All Fields are required');
                                            }
                                            else {
                                              ref.child(
                                                  UserRecords().Userid
                                                      .toString())
                                                  .update({
                                                'flat bench press weights': flatweightController
                                                    .text.toString(),
                                                'flat bench press sets': flatsetsController
                                                    .text.toString(),
                                                'flat bench press reps': flatrepsController
                                                    .text.toString(),
                                              })
                                                  .then((value) {
                                                toast('Workout Tracked');
                                                flatweightController.clear();
                                                flatsetsController.clear();
                                                flatrepsController.clear();
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
                          child: Text('Decline bench press',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                        Spacer(),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images/cap4.png"),
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
                                                            controller: declineweightController,
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
                                                          controller: declinesetsController,
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
                                                                controller: declinerepsController,
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
                                            if(declineweightController.text.toString().isEmpty || declinesetsController.text.toString().isEmpty || declinerepsController.text.toString().isEmpty  ){
                                              toast('All Fields are required');
                                            }
                                            else {
                                              ref.child(
                                                  UserRecords().Userid
                                                      .toString())
                                                  .update({
                                                'Decline bench press weights': declineweightController
                                                    .text.toString(),
                                                'Decline bench press sets': declinesetsController
                                                    .text.toString(),
                                                'Decline bench press reps': declinerepsController
                                                    .text.toString(),
                                              })
                                                  .then((value) {
                                                toast('Workout Tracked');
                                                declineweightController.clear();
                                                declinesetsController.clear();
                                                declinerepsController.clear();
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
                          child: Text('Chest Machine press',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                        Spacer(),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images/cap6.png"),
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
                                                            controller: machineweightController,
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
                                                          controller: machinesetsController,
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
                                                                controller: machinerepsController,
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
                                            if(machineweightController.text.toString().isEmpty || machinesetsController.text.toString().isEmpty || machinerepsController.text.toString().isEmpty  ){
                                              toast('All Fields are required');
                                            }
                                            else {
                                              ref.child(
                                                  UserRecords().Userid
                                                      .toString())
                                                  .update({
                                                'Chest Machine press weights': machineweightController
                                                    .text.toString(),
                                                'Chest Machine press sets': machinesetsController
                                                    .text.toString(),
                                                'Chest Machine press reps': machinerepsController
                                                    .text.toString(),
                                              })
                                                  .then((value) {
                                                toast('Workout Tracked');
                                                machineweightController.clear();
                                                machinesetsController.clear();
                                                machinerepsController.clear();
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
                          child: Text('Chest Dips',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                        Spacer(),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images/cap5.png"),
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
                                                            controller: dipsweightController,
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
                                                          controller: dipssetsController,
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
                                                                controller: dipsrepsController,
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
                                            if(dipsweightController.text.toString().isEmpty || dipssetsController.text.toString().isEmpty || dipsrepsController.text.toString().isEmpty  ){
                                              toast('All Fields are required');
                                            }
                                            else {
                                              ref.child(
                                                  UserRecords().Userid
                                                      .toString())
                                                  .update({
                                                'Chest Dips weights': dipsweightController
                                                    .text.toString(),
                                                'Chest DIps sets': dipssetsController
                                                    .text.toString(),
                                                'Chest Dips reps': dipsrepsController
                                                    .text.toString(),
                                              })
                                                  .then((value) {
                                                toast('Workout Tracked');
                                                dipsweightController.clear();
                                                dipssetsController.clear();
                                                dipsrepsController.clear();
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