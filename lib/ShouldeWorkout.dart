import 'package:alphafitness/reversefly.dart';
import 'package:alphafitness/shoulderpress.dart';
import 'package:alphafitness/sideraises.dart';
import 'package:alphafitness/uprightrow.dart';
import 'package:flutter/material.dart';
import 'frontraises.dart';
import 'set_height_and_width.dart';
class shoulder_workout extends StatefulWidget {
  const shoulder_workout({Key? key}) : super(key: key);

  @override
  State<shoulder_workout> createState() => _shoulder_workoutState();
}

class _shoulder_workoutState extends State<shoulder_workout> {
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

                'SHOULDER',style: TextStyle(color: Colors.red),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sideraisesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/sideraises.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Dumbbell Side Raises',
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
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>frontraisesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/frontraises.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.42,
                          child: Text('Dumbbell Front Raises',
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
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>shoulderpressscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/shoulderpress.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Shoulder Press',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>reverseflyscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/reversefly.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Reverse Fly',
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
               Navigator.push(context, MaterialPageRoute(builder: (context)=>uprightrowscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/uprightrow.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Barbell Upright Row',
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
