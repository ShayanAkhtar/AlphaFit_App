import 'package:alphafitness/FirstScreen.dart';
import 'package:alphafitness/LoginPage.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/WorkoutIntermediate.dart';
import 'package:alphafitness/WorkoutsSelect.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:alphafitness/set_height_and_width.dart';
import 'package:alphafitness/userpage.dart';
import 'package:alphafitness/workoutadvanced.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'MoreArticles.dart';
import 'MoreNutritions.dart';
import 'package:intl/intl.dart';
import 'MoreScreen.dart';
import 'ScheduleScreen.dart';
import 'Timer.dart';
import 'UserProfile.dart';
import 'WorkoutBeginnner.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final auth=FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('users');
  var time=DateTime.now();
  // int myindex=0;
  // final Pages=[
  //   naviagtorone(),
  //   timer(),
  //   naviagtorone(),
  //   usermenu(),
  // ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:
      Scaffold(
        appBar: AppBar(
          toolbarHeight: getheight(context)*0.1,
          backgroundColor: Colors.black,
          title: Text(
            'Routines',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            Center(
              child: Container(
                margin: EdgeInsets.only(right: 25),
                child: Text(
                  DateFormat('EEEE  d, MMMM').format(time),
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,

                  ),
                ),
              ),
            ),
          ],
        ),
       drawer: Container(
         color: Colors.black,
         width: getwidth(context)*0.25,
         child: Drawer(
           backgroundColor: Colors.black,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(
                 height: 20,
               ),
               InkWell(
                 child:Container(



               child: CircleAvatar(
                 child: FirebaseAnimatedList(
                   query: ref.orderByChild('Email').equalTo(auth.currentUser?.email.toString()),
                   itemBuilder: (context,snapshot,animation,index){
                     return Container(
                       height: getheight(context)*0.08,
                       child: Row(
                         children: [
                           Text(
                             snapshot.child('First Name').value.toString().substring(0,1
                             ),
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                           SizedBox(width: 0.5,),
                           Text(
                             snapshot.child('Last Name').value.toString().substring(0,1
                             ),
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),

                         ],
                         mainAxisAlignment: MainAxisAlignment.center,
                       ),
                     );
                   },
                 ),
                    backgroundColor: Colors.white10,
                 radius:35,

               ),
                 ),
                 onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>user_profile()));
                 },
             ),
               SizedBox(
                 height: 40.0,
               ),
               IconButton(
                 onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>homescreen()));
                 },
                 icon: Icon(Icons.home,
                 ),
iconSize: 40,
                 color: Colors.red,
               ),
               Text('Home',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               IconButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>workoutsselect()));
                 },
                 icon: Icon(Icons.sports_gymnastics_rounded,
                 ),
                 iconSize: 40,
                 color: Colors.red,
               ),
               Text('Workouts',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               IconButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>schedule_screen()));
                 },
                 icon: Icon(Icons.edit_note_sharp
                 ),
                 iconSize: 40,
                 color: Colors.red,
               ),
               Text('Schedule',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               IconButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>more_screen()));
                 },
                 icon: Icon(Icons.apps,
                 ),
                 iconSize: 40,
                 color: Colors.red,
               ),
               Text('More',
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               Spacer(),
               IconButton(
                 onPressed: (){
                   auth.signOut().then((value){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginpage(usernameController: '',)));
                   }).onError((error, stackTrace){
                     toast(error.toString());
                   });
                 },
                 icon: Icon(Icons.exit_to_app_rounded,
                 ),
                 iconSize: 35,
                 color: Colors.red,
               ),
             ],
           ),
         ),
       ),

      //   bottomNavigationBar: BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Colors.black,
      //     selectedItemColor: Colors.red,
      //     unselectedItemColor: Colors.white,
      //     elevation: 0,
      //     selectedIconTheme: IconThemeData(
      //       size: 40.0,
      //
      //     ),
      //     items: [
      //        BottomNavigationBarItem(
      //          icon: Icon(Icons.home,),
      //          label: ''
      //        ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.access_alarm_outlined,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.add_chart_sharp,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: '',
      //       ),
      //     ],
      //     onTap: (index){
      //       setState(() {
      //         myindex=index;
      //       });
      //     },
      //     currentIndex: myindex,
      //   ),
      // // floatingActionButton: FloatingActionButton(
      // //   onPressed: (){},
      // //   child: Icon(
      // //     Icons.timer_sharp,
      // //   ),
      // //   backgroundColor: Colors.red,
      // // ),
      // backgroundColor: Colors.black,
      // body: Pages[myindex],
//       ));
//   }
// }

// class naviagtorone extends StatefulWidget {
//   const naviagtorone({Key? key}) : super(key: key);
//
//   @override
//   State<naviagtorone> createState() => _naviagtoroneState();
// }
//
// class _naviagtoroneState extends State<naviagtorone> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getwidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    // Container(
                    //   margin: EdgeInsets.only(left: getwidth(context)*0.08,top: getheight(context)*0.05),
                    //   child: Text(
                    //     'Routines',
                    //
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 25.0,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(top: getheight(context)*0.05,left: getwidth(context)*0.55),
                    //   child: Builder(
                    //     builder: (context) {
                    //       return IconButton(
                    //         onPressed: (){
                    //           Scaffold.of(context).openDrawer();
                    //         },
                    //         icon: Icon(Icons.menu_rounded),
                    //         color: Colors.white,
                    //       );
                    //     }
                    //   ),
                    // ),
                  ],
                ),
              ),
              // Beginner Container
              InkWell(
                child:
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: getheight(context)*0.2,
                  width: getwidth(context)*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/calis1.jpg"),
                        fit: BoxFit.cover,
                      )
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/picturebeg.jpg'),
                      //   fit: BoxFit.cover,
                      // )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'BEGINNER',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.03),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getheight(context)*0.09,left: getwidth(context)*0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.white30,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.white30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //chest beginner on tap
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>workoutbeginner()));
                },
              ),
              //Intermediate Container
              InkWell(
                child:
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: getheight(context)*0.2,
                  width: getwidth(context)*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/calis2.jpg"),
                        fit: BoxFit.cover,
                      )
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/basic.jpg'),
                      //   fit: BoxFit.cover,
                      // )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'INTERMEDIATE',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.03),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getheight(context)*0.09,left: getwidth(context)*0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.white30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //chest beginner on tap
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>workoutintermediate()));
                },
              ),
              //advance container
              InkWell(
                child:
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: getheight(context)*0.2,
                  width: getwidth(context)*0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage("assets/images/calis3.jpg"),
                        fit: BoxFit.cover,
                      )
                      // image: DecorationImage(
                      //  // image: AssetImage('assets/images/picturei.jpg'),
                      //   fit: BoxFit.cover,
                      // )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'ADVANCED',
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: 'Kanit',
                              color: Colors.white,
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: EdgeInsets.only(top: getheight(context)*0.02,left: getwidth(context)*0.03),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: getheight(context)*0.09,left: getwidth(context)*0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.bolt,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //chest beginner on tap
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>workoutadvance()));
                },
              ),
              Container(
                width: getwidth(context),
                margin: EdgeInsets.only(left: getwidth(context)*0.08,top: getheight(context)*0.02),
                child: Text(
                  'HEALTHY LIFESTYLE',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10.0,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: getwidth(context)*0.6,
                    margin: EdgeInsets.only(left: getwidth(context)*0.08,),
                    child: Text(
                      'HEALTHY ARTICLES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: getwidth(context)*0.05),
                    child: TextButton(
                      child: Text(
                        'see all',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>morearticles()));
                      },
                    ),
                  ),


                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: getwidth(context)*0.8,
                          height: getheight(context)*0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Row(

                                children: [
                                  Container(

                                    child: Text(
                                      'Top Vegetables That Are High In protein',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                    width: getwidth(context)*0.6,
                                  ),
                                  Container(
                                    width: getwidth(context)*0.23,
                                    height: getheight(context)*0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/vegg.jpg"),
                                            fit: BoxFit.cover
                                        )
                                    ),

                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center
                                , crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02)
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: getwidth(context)*0.8,
                          height: getheight(context)*0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Row(

                                children: [
                                  Container(

                                    child: Text(
                                      'Reasons Why Sugar Is Bad For You',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                    width: getwidth(context)*0.6,
                                  ),
                                  Container(
                                    width: getwidth(context)*0.23,
                                    height: getheight(context)*0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/nosugar.jpg"),
                                            fit: BoxFit.cover
                                        )
                                    ),

                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center
                                , crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.02,right: getwidth(context)*0.02)
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: getwidth(context)*0.8,
                          height: getheight(context)*0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Row(

                                children: [
                                  Container(

                                    child: Text(
                                      'The Benefits Of jumping Rope Training ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                    width: getwidth(context)*0.6,
                                  ),
                                  Container(
                                    width: getwidth(context)*0.23,
                                    height: getheight(context)*0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/rope.jpg"),
                                            fit: BoxFit.cover
                                        )
                                    ),

                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center
                                , crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.02,right: getwidth(context)*0.02)
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.13,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: getwidth(context)*0.8,
                          height: getheight(context)*0.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Row(

                                children: [
                                  Container(

                                    child: Text(
                                      '6 Reasons For Doing Calisthenics Workouts  ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                    width: getwidth(context)*0.6,
                                  ),
                                  Container(
                                    width: getwidth(context)*0.23,
                                    height: getheight(context)*0.08,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/street.jpg"),
                                            fit: BoxFit.cover
                                        )
                                    ),

                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center
                                , crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.02,right: getwidth(context)*0.02)
                    ),
                  ],
                ),
              ),

              //Nutrition portion

              Container(
                width: getwidth(context),
                margin: EdgeInsets.only(left: getwidth(context)*0.08,top: getheight(context)*0.02),
                child: Text(
                  'HEALTHY FOOD',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10.0,
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    width: getwidth(context)*0.6,
                    margin: EdgeInsets.only(left: getwidth(context)*0.08,),
                    child:
                    Text(
                      'NUTRITION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                     margin: EdgeInsets.only(right: getwidth(context)*0.05,),
                    child: TextButton(
                      child:
                      Text(
                        'see all',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>morenutrition()));
                      },
                    ),
                  ),

                ],
              ),
              SingleChildScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 33),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.38,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                                height: getheight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage ("assets/images/fishy.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Fish',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Fish is filled with omega-3 fatty acids and vitamins such as D and B2 (riboflavin). Fish is rich in calcium and phosphorus and a great source of minerals, such as iron, zinc, iodine, magnesium, and potassium.',
                                  style: TextStyle(
                                    color: Colors.white70,

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.38,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                                height: getheight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage ("assets/images/stawbery.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Strawberry',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Strawberries are an excellent source of vitamin C and manganese and also contain decent amounts of folate (vitamin B9) and potassium. Strawberries are very rich in antioxidants and plant compounds.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.38,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                                height: getheight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage ("assets/images/potatoes.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Potatoes',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Potatoes are rich in vitamin C, which is an antioxidant. Potatoes were a life-saving food source in early times because the vitamin C prevented scurvy. Another major nutrient in potatoes is potassium.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.38,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                                height: getheight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage ("assets/images/bananas.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Banana',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Is it good to eat a banana every day. They are full of important nutrients, but eating too many could do more harm than good. Too much of any single food may contribute to weight gain and nutrient deficiencies. ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
                    ),
                    Container(

                        width: getwidth(context)*0.9,
                        height: getheight(context)*0.38,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                                height: getheight(context)*0.22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage ("assets/images/eggs.jpg"),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Eggs',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                                child: Text(
                                  'Eggs are also a great source of heart-healthy nutrients like potassium, folate and B vitamins. Some research suggests that up to two eggs per day actually improves heart health.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      )));
  }
}



