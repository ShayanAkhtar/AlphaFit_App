import 'package:flutter/material.dart';
import 'BicycleCrunches.dart';
import 'CrunchesFrog.dart';
import 'LegRaises.dart';
import 'set_height_and_width.dart';
class abs_workout extends StatefulWidget {
  const abs_workout({Key? key}) : super(key: key);

  @override
  State<abs_workout> createState() => _abs_workoutState();
}

class _abs_workoutState extends State<abs_workout> {
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

                'ABS',style: TextStyle(color: Colors.red),),
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
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>legraisesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/legraises.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Alternate Leg Raises',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>frogcrunchesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/crunches.png"),
                          radius: 40,
                        ),
                        Container(
                         width:
                          getwidth(context)*0.4,
                          child: Text('Crunches Frog',
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>bicyclecrunchesscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/bicycle.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Bicycle Crunches',
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

            ],
          ),
        ),
      ),
    );
  }
}
