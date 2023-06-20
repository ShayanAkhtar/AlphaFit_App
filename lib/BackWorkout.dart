import 'package:alphafitness/seatedrow.dart';
import 'package:flutter/material.dart';
import 'BentArm.dart';
import 'PullUps.dart';
import 'deadlift.dart';
import 'latsPulldown.dart';
import 'set_height_and_width.dart';

class back_workout extends StatefulWidget {
  const back_workout({Key? key}) : super(key: key);

  @override
  State<back_workout> createState() => _back_workoutState();
}

class _back_workoutState extends State<back_workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        height: getheight(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>latspulldownscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/latpulldown.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Lat Pull down',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                        ),
                        Icon(Icons.navigate_next,
                          color: Colors.white,)
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(top: 50,left: 15,right: 15),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>seatedrowscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/seatedrow.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Seated cable Row',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                        ),

                        Icon(Icons.navigate_next,
                          color: Colors.white,)
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(left: 15,right: 15),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>deadliftscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("assets/images/deadlift.png"),
                            radius: 40,
                          ),
                          Container(
                            width: getwidth(context)*0.4,
                            child: Text('Dead Lift',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                          ),
                          Icon(Icons.navigate_next,
                            color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 15,right: 15),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bentarmscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/armpullover.png"),
                          radius: 40,
                        ),
                       Container(
                         width: getwidth(context)*0.4,
                         child: Text('Bent Arm Pull Over',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                       ),

                        Icon(Icons.navigate_next,
                          color: Colors.white,)
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(left: 15,right: 15),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pullupsscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/pullups.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Weighted Pull Ups',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                        ),
                        Icon(Icons.navigate_next,
                          color: Colors.white,)
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(left: 15,right: 15),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(30)
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
