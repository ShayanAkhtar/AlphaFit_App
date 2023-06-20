import 'package:flutter/material.dart';
import 'barbellseated.dart';
import 'bicepcurl.dart';
import 'cablecurl.dart';
import 'dipsbench.dart';
import 'dipsmachine.dart';
import 'set_height_and_width.dart';
class arms_workout extends StatefulWidget {
  const arms_workout({Key? key}) : super(key: key);

  @override
  State<arms_workout> createState() => _arms_workoutState();
}

class _arms_workoutState extends State<arms_workout> {
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

                'ARMS',style: TextStyle(color: Colors.red),),
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
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>cablecurlscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/cablecurl.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Cable Biceps Curl',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>dumbellbicepscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/bicepscurl.png"),
                          radius: 40,
                        ),
                        Container(
                          child: Container(
                            width: getwidth(context)*0.4,
                            child: Text('Dumbell Biceps Curl',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                          ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>seatedcurlscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/barbellseated.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Barbell Seated Curl',
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
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>dipsmachinescreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/dipsmachine.png"),
                          radius: 40,
                        ),
                        Container(
                          child: Container(
                            width: getwidth(context)*0.4,
                            child: Text('Triceps Dips Machine',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                          ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>dipsbenchscreen()));
                },
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage("assets/images/benchdips.png"),
                          radius: 40,
                        ),
                        Container(
                          width: getwidth(context)*0.4,
                          child: Text('Bench Triceps Dips',
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
