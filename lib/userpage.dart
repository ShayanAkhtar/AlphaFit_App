import 'UserSignUp.dart';
import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
class usermenu extends StatefulWidget {
  const usermenu({Key? key}) : super(key: key);

  @override
  State<usermenu> createState() => _usermenuState();
}

class _usermenuState extends State<usermenu> {
  final _formfield=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    image: AssetImage("assets/images/p2.jpg"),
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
                        'In',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Form(
                  key: _formfield,
                  child: Column(

                  children:[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: getwidth(context)*0.89,
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter email';
                      }
                      return null;
                    },
                    controller: emailcontroller,
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
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter password';
                      }
                      return null;
                    },
                    controller: passwordcontroller,
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
        ],
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
                        'Log in',
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
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>user_sign_up()));
                    },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white38,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          )
                      ),
                      child: Text(
                        'Sign up',
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
