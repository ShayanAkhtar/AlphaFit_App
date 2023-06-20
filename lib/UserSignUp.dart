import 'package:alphafitness/userpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(user_sign_up());
}
class user_sign_up extends StatefulWidget {

  const user_sign_up({Key? key}) : super(key: key);
  @override
  State<user_sign_up> createState() => _user_sign_upState();
}

class _user_sign_upState extends State<user_sign_up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          height: getheight(context),
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getheight(context)*0.35,
                  width: getwidth(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/p3.jpg"),
                        fit: BoxFit.cover,


                      )
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25.0) ,
                      child: Text(
                        'Sign',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      child: Text(
                        'Up',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: getwidth(context)*0.89,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Username",
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                          fontSize: 18.0,

                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )

                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: getwidth(context)*0.89,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        hintText: "Alphafitness@gmail.com",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white24,
                          fontSize: 18.0,

                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )

                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  width: getwidth(context)*0.89,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.white24,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1
                            )

                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: getheight(context)*0.05),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: getwidth(context)*0.4,height: getwidth(context)*0.12),
                    child: ElevatedButton(onPressed: () {

                    },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          )
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: getwidth(context)*0.4,height: getwidth(context)*0.12),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>usermenu()));
                    },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white38,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          )
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
