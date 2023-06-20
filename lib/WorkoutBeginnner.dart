
import 'package:lottie/lottie.dart';
import 'HomeScreen.dart';
import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
class workoutbeginner extends StatefulWidget {
  const workoutbeginner({Key? key}) : super(key: key);

  @override
  State<workoutbeginner> createState() => _workoutbeginnerState();
}

class _workoutbeginnerState extends State<workoutbeginner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBar(
          height: 53.0,
          color: Colors.black26,
          child: IconButton(
        padding: EdgeInsets.only(left: getwidth(context)*0.05),
    alignment: Alignment.centerLeft,
    onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>homescreen()));
    },
    icon: Icon(
    Icons.arrow_back_sharp,
    color: Colors.red,
    size: 27.0,
    ),
          ),
      ),
      body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Container(
            margin: EdgeInsets.only(top: getheight(context)*0.1,left: getwidth(context)*0.06),
        width: getwidth(context)*0.2,
        height: getheight(context)*0.02,
        child: Text(
          'Level',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,

          ),
        )
      ),
      Container(
        width: getwidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              width: getwidth(context)*0.4,
              height: getheight(context)*0.025,
              margin: EdgeInsets.only(left: getwidth(context)*0.06),
              child: Text(
                'BEGINNER',

                style: TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(

            ),
            Container(
              margin: EdgeInsets.only(),
              child: IconButton(
                onPressed: (){
                  showModalBottomSheet(

                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context){
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                            ),

                            width: getwidth(context),
                            height: getheight(context)*0.65,
                            child:
                            SingleChildScrollView(
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(

                                   children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Quick Warmup',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        margin: EdgeInsets.only(left: 15,top: 10),
                                        width: getwidth(context)*0.4,
                                        height: getheight(context)*0.05,
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                  Container(
                                    width: getwidth(context),
                                    height: 1.5,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    child: Text(
                                      'Warm up properly before exercising to prevent injury ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  ),
                                  Container(
                                    child: Text(
                                      'and make your workouts more effective.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 2.0),
                                  ),
                                  Container(
                                    child: Text(
                                      'Repeat each exercise for 20 seconds',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0,bottom: 25.0),
                                  ),

                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Lottie.asset('assets/animations/pushups.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),

                                        Container(
                                          child: Lottie.asset('assets/animations/jumping_jack.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),
                                        Container(
                                          child: Lottie.asset('assets/animations/squats.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child:Text(
                                            'Pushups',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ),

                                        Container(
                                            child:Text(
                                              'Jumping Jack',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                        ),
                                        Container(
                                            child:Text(
                                              'Squat Kick',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                        ),

                                      ],
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  ),
                                  SizedBox(
                                    height: 9.0,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Lottie.asset('assets/animations/abs.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),

                                        Container(
                                          child: Lottie.asset('assets/animations/t_plank.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),
                                        Container(
                                          child: Lottie.asset('assets/animations/split_jump.json',
                                            fit: BoxFit.cover,
                                            height: getheight(context)*0.08,
                                            frameRate: FrameRate(60),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child:Text(
                                              'Seated Abs',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                        ),

                                        Container(
                                            child:Text(
                                              'T-Plank',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                        ),
                                        Container(
                                            child:Text(
                                              'Split Jump',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  ),
                                  // Container(
                                  //   child: Text(
                                  //     'Your body needs energy to work normally and keep you alive. You obtain this energy from nutrients in the food that you eat - mostly, carbohydrates, fats and proteins. Minerals and vitamins are other nutrients that are also important in your diet to help your body stay healthy. It is important to find the right balance between these different nutrients to achieve maximum health benefits',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 15.0,
                                  //     ),
                                  //   ),
                                  //   margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  // ),
                                  // SizedBox(
                                  //   height: 8.0,
                                  // ),
                                  //
                                  // Container(
                                  //   child: Text(
                                  //     'As a general rule, vegetables, fruits and starchy foods should provide the bulk of most of your meals. The remaining part of your diet should be made up from milk and dairy foods and protein foods. As mentioned above, you should limit the amount of foods and drinks that are high in fat or sugar.',
                                  //     style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 15.0,
                                  //     ),
                                  //   ),
                                  //   margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
                                  // ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  InkWell(

                                    child: Container(
                                      width: getwidth(context),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Close',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(top: 25.0,left: getwidth(context)*0.05,right: getwidth(context)*0.05,bottom: 20.0),
                                    ),
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ));
                      }
                  );

                },
                icon: Icon(Icons.sports_gymnastics,

                  color: Colors.white,
                ),
                focusColor: Colors.red,

                ),

            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner1()));
                        },
                       child:

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/beginner_basic.jpg"),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Basic Beginner',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                      SizedBox(
                        width: getwidth(context)*0.05,
                      ),
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner2()));
    },
                       child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_back.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Back-Bieps',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner3()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_shoulder.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Shoulder Routine',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                      SizedBox(
                        width: getwidth(context)*0.05,
                      ),
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner4()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_chest.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Chest Routine',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner5()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_fullbody.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Full Body',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                      SizedBox(
                        width: getwidth(context)*0.05,
                      ),
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner6()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_mix.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Beginner-Mix',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner7()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_triceps.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Triceps Routine',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,

                      ),
                      ),
                      SizedBox(
                        width: getwidth(context)*0.05,
                      ),
                      InkWell(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>animatebeginner8()));
    },
    child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getheight(context)*0.3,
                              width: getwidth(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/beginner_legs.jpg"),
                                    scale: 1.0,
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: getwidth(context)*0.032),
                              child: Text(
                                'Legs Routine',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: getheight(context)*0.35,
                        width: getwidth(context)*0.45,
                      ),
                      ),
                    ],
                  ),
      ],
    ),
    ));
  }
}

class animatebeginner1 extends StatefulWidget {
  const animatebeginner1({Key? key}) : super(key: key);

  @override
  State<animatebeginner1> createState() => _animatebeginner1State();
}

class _animatebeginner1State extends State<animatebeginner1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
    child: InteractiveViewer(
    child:
      Container(
        child: Image(
          image: AssetImage("assets/images/beginner_basic.jpg"),
        ),
      ),
    ),
    ),
    );
  }
}


class animatebeginner2 extends StatefulWidget {
  const animatebeginner2({Key? key}) : super(key: key);

  @override
  State<animatebeginner2> createState() => _animatebeginner2State();
}

class _animatebeginner2State extends State<animatebeginner2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_back.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}


class animatebeginner3 extends StatefulWidget {
  const animatebeginner3({Key? key}) : super(key: key);

  @override
  State<animatebeginner3> createState() => _animatebeginner3State();
}

class _animatebeginner3State extends State<animatebeginner3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_shoulder.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}




class animatebeginner4 extends StatefulWidget {
  const animatebeginner4({Key? key}) : super(key: key);

  @override
  State<animatebeginner4> createState() => _animatebeginner4State();
}

class _animatebeginner4State extends State<animatebeginner4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_chest.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}



class animatebeginner5 extends StatefulWidget {
  const animatebeginner5({Key? key}) : super(key: key);

  @override
  State<animatebeginner5> createState() => _animatebeginner5State();
}

class _animatebeginner5State extends State<animatebeginner5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_fullbody.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}



class animatebeginner6 extends StatefulWidget {
  const animatebeginner6({Key? key}) : super(key: key);

  @override
  State<animatebeginner6> createState() => _animatebeginner6State();
}

class _animatebeginner6State extends State<animatebeginner6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_mix.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}



class animatebeginner7 extends StatefulWidget {
  const animatebeginner7({Key? key}) : super(key: key);

  @override
  State<animatebeginner7> createState() => _animatebeginner7State();
}

class _animatebeginner7State extends State<animatebeginner7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_triceps.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}




class animatebeginner8 extends StatefulWidget {
  const animatebeginner8({Key? key}) : super(key: key);

  @override
  State<animatebeginner8> createState() => _animatebeginner8State();
}

class _animatebeginner8State extends State<animatebeginner8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child:
          Container(
            child: Image(
              image: AssetImage("assets/images/beginner_legs.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}
