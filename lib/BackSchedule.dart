import 'package:flutter/material.dart';
import 'package:alphafitness/ChestWorkout.dart';
import 'package:alphafitness/ScheduleScreen.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'BackWorkout.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class back_schedule extends StatefulWidget {
  const back_schedule({Key? key}) : super(key: key);

  @override
  State<back_schedule> createState() => _back_scheduleState();
}

class _back_scheduleState extends State<back_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final latssetsController=TextEditingController();
  final latsrepsController=TextEditingController();
  final latsweightController=TextEditingController();
  final seatedrowsetsController=TextEditingController();
  final seatedrowrepsController=TextEditingController();
  final seatedrowweightController=TextEditingController();
  final deadliftsetsController=TextEditingController();
  final deadliftrepsController=TextEditingController();
  final deadliftweightController=TextEditingController();
  final bentarmsetsController=TextEditingController();
  final bentarmrepsController=TextEditingController();
  final bentarmweightController=TextEditingController();
  final pullupssetsController=TextEditingController();
  final pullupsrepsController=TextEditingController();
  final pullupsweightController=TextEditingController();
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

                'BACK',style: TextStyle(color: Colors.red),),
            ),
            SizedBox(
              width: 8,
            ),
            Text('WORKOUTS',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>back_workout()));
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
                            child: Text('Lats Pulldown',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/latpulldown.png"),
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
                                                              controller: latsweightController,
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
                                                            controller: latssetsController,
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
                                                                  controller: latsrepsController,
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
                                              if(latsweightController.text.toString().isEmpty || latssetsController.text.toString().isEmpty || latsrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'lats Pulldown weights': latsweightController
                                                      .text.toString(),
                                                  'lats Pulldown sets': latssetsController
                                                      .text.toString(),
                                                  'Lats Pulldown reps': latsrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  latsweightController.clear();
                                                  latssetsController.clear();
                                                  latsrepsController.clear();
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
                            child: Text('Seated Cable Row',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/seatedrow.png"),
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
                                                              controller: seatedrowweightController,
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
                                                            controller:seatedrowsetsController,
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
                                                                  controller: seatedrowrepsController,
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
                                              if(seatedrowweightController.text.toString().isEmpty || seatedrowsetsController.text.toString().isEmpty || seatedrowrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Seated Cable weights': seatedrowweightController
                                                      .text.toString(),
                                                  'Seated Cable  sets': seatedrowsetsController
                                                      .text.toString(),
                                                  'Seated Cable reps': seatedrowrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  seatedrowweightController.clear();
                                                  seatedrowsetsController.clear();
                                                  seatedrowrepsController.clear();
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
                            child: Text('Dead Lift',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/deadlift.png"),
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
                                                              controller: deadliftweightController,
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
                                                            controller: deadliftsetsController,
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
                                                                  controller: deadliftrepsController,
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
                                              if(deadliftweightController.text.toString().isEmpty || deadliftsetsController.text.toString().isEmpty || deadliftrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Dead lift weights': deadliftweightController
                                                      .text.toString(),
                                                  'Dead Lift sets': deadliftsetsController
                                                      .text.toString(),
                                                  'Dead Lift reps': deadliftrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  deadliftweightController.clear();
                                                  deadliftsetsController.clear();
                                                  deadliftrepsController.clear();
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
                            child: Text('Bent Arm Pull Over',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/armpullover.png"),
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
                                                              controller: bentarmweightController,
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
                                                            controller: bentarmsetsController,
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
                                                                  controller: bentarmrepsController,
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
                                              if(bentarmweightController.text.toString().isEmpty || bentarmsetsController.text.toString().isEmpty || bentarmrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Bent Arm weights': bentarmweightController
                                                      .text.toString(),
                                                  'Bent Arm sets': bentarmsetsController
                                                      .text.toString(),
                                                  'Bent Arm reps': bentarmrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  bentarmweightController.clear();
                                                  bentarmsetsController.clear();
                                                  bentarmrepsController.clear();
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
                            child: Text('Weighted Pull Ups',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                          Spacer(),
                          Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage("assets/images/pullups.png"),
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
                                                              controller: pullupsweightController,
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
                                                            controller: pullupssetsController,
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
                                                                  controller: pullupsrepsController,
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
                                              if(pullupsweightController.text.toString().isEmpty || pullupssetsController.text.toString().isEmpty || pullupsrepsController.text.toString().isEmpty  ){
                                                toast('All Fields are required');
                                              }
                                              else {
                                                ref.child(
                                                    UserRecords().Userid
                                                        .toString())
                                                    .update({
                                                  'Pull Ups weights': pullupsweightController
                                                      .text.toString(),
                                                  'Pull Ups sets': pullupssetsController
                                                      .text.toString(),
                                                  'Pull Ups reps': pullupsrepsController
                                                      .text.toString(),
                                                })
                                                    .then((value) {
                                                  toast('Workout Tracked');
                                                  pullupsweightController.clear();
                                                  pullupssetsController.clear();
                                                  pullupsrepsController.clear();
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
