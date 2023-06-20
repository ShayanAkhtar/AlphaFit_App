import 'package:alphafitness/squats.dart';
import 'package:flutter/material.dart';
import 'calves.dart';
import 'legextension.dart';
import 'legpress.dart';
import 'lunges.dart';
import 'set_height_and_width.dart';
class legs_workout extends StatefulWidget {
  const legs_workout({Key? key}) : super(key: key);

  @override
  State<legs_workout> createState() => _legs_workoutState();
}

class _legs_workoutState extends State<legs_workout> {
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

                'LEGS',style: TextStyle(color: Colors.red),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>legpressscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/legpress.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Leg Press',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>squatsscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/squat.png"),
                          radius: 40,
                        ),
                        Container(
                         width: getwidth(context)*0.4,
                          child: Text('Weighted Squats',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>lungesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/lunges.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Barbell Front Lunges',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>legsextensionscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/legextension.png"),
                          radius: 40,
                        ),
                        Container(
                         width: getwidth(context)*0.4,
                          child: Text('Leg Extension',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>calvesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/calve.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Calve Raises',
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
