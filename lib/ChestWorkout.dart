import 'package:alphafitness/ChestMachine.dart';
import 'package:alphafitness/InclineChest.dart';
import 'package:flutter/material.dart';
import 'ChestDips.dart';
import 'DeclineCHest.dart';
import 'InclineChest.dart';
import 'FlatChest.dart';
import 'HomeScreen.dart';
import 'set_height_and_width.dart';
class chest_workout extends StatefulWidget {
  const chest_workout({Key? key}) : super(key: key);

  @override
  State<chest_workout> createState() => _chest_workoutState();
}

class _chest_workoutState extends State<chest_workout> {
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

                'CHEST',style: TextStyle(color: Colors.red),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>inclinechestscreen()));
                },
          child:
              Container(
               child: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     CircleAvatar(
                       backgroundColor: Colors.black,
                       backgroundImage: AssetImage("assets/images/cap1.png"),
                       radius: 40,
                     ),
                     Container(
                       width: getwidth(context)*0.4,
                       child: Text('Incline Dumbell Press',
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>flatchestscreen()));
          },
          child:
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage("assets/images/cap2.png"),
                        radius: 40,
                      ),
                      Container(
                        width: getwidth(context)*0.4,
                        child: Text('Flat Dumbell Press',
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>declinechestscreen()));
          },
          child:
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage("assets/images/cap4.png"),
                        radius: 40,
                      ),
                      Container(
                        width: getwidth(context)*0.42,
                        child: Text('Decline Dumbell Press',
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>chestdipsscreen()));
          },
          child:
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage("assets/images/cap5.png"),
                        radius: 40,
                      ),
                      Container(
                        width: getwidth(context)*0.4,
                        child: Text('Chest Dips',
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>chestmachinescreen()));
          },
          child:
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage("assets/images/cap6.png"),
                        radius: 40,
                      ),
                      Container(
                        width: getwidth(context)*0.4,
                        child: Text('Chest Machine Press',
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
