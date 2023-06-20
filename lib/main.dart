import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

import 'StartingScreen.dart';
import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import 'HomeScreen.dart';
import 'set_height_and_width.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: firstscreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
            ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> firstscreen())
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: getwidth(context),
          height: getheight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_screen_pic.jpg'),
              fit: BoxFit.cover,
            ),

          ),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                alignment: Alignment.centerLeft,
                // margin: EdgeInsets.only(right: 100.0),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/alphalogo.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                width:180,
                height: 50,
                child:  Center(
                  child:
                  Text(
                    'ENERGY & PERSISTENCE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}


