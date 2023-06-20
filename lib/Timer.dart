import 'package:alphafitness/set_height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro4d/pomodoro4d.dart';
class timer extends StatefulWidget {
  const timer({Key? key}) : super(key: key);

  @override
  State<timer> createState() => _timerState();
}

class _timerState extends State<timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(

            children: [
              SizedBox(
                height: 20,
              ),
              TimerCard(),
            ],
          ),
        ),
      ),
    );
  }
}




// ..................  Time Card ..................

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('FOCUS',style: TextStyle(
          letterSpacing: 0.5,
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: getheight(context)*0.1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getwidth(context)*0.32,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Center(
                child: Text(

              '12',
              style: TextStyle(
                fontSize: 25.0,
                    color:  Colors.black,
              ),
              ),
            ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(":",style: TextStyle(
              fontSize: 60.0,
              color: Colors.white60
            ),),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: getwidth(context)*0.32,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: Center(
                child: Text(

                  '00',
                  style: TextStyle(
                    fontSize: 25.0,
                    color:  Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}



//.................... TIme Options .....................

class timeoptions extends StatelessWidget {
  const timeoptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      ),
    );
  }
}


 List select_time = [
  "300",  // 5 min
  "600",   //10 min
  "900",  // upto so on to 55 min
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300"

];