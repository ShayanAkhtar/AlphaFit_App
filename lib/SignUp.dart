import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alphafitness/LoginPage.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'set_height_and_width.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
bool loading =false;
  final _formfield=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  final firstnameController=TextEditingController();
final lastnameController=TextEditingController();

  bool passToggle=true;
  FirebaseAuth _auth=FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.ref().child('users');


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        body: Container(
            height: getheight(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/get_started_pic.jpg"),
                  fit: BoxFit.cover,
                )
            ),
           child:
              SingleChildScrollView(
                child:Form(
                  key: _formfield,
                  child: Column(
                    
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ALPHA',style: TextStyle(color: Colors.red,fontSize: 30,letterSpacing: 1,fontFamily: "BebasNeue"),),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Fitness',style: TextStyle(color: Colors.white70,fontSize: 30,letterSpacing: 1,fontFamily: "BebasNeue"),)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: getwidth(context)*0.42,
                            margin: EdgeInsets.only(top:getheight(context)*0.39,left: getwidth(context)*0.05),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Field is missing';
                                }
                              },

                              keyboardType: TextInputType.name,
                              controller: firstnameController,
                              decoration: InputDecoration(
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                    color: Colors.red,
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

                                  ),
                                  prefixIcon: Icon(Icons.person,
                                    color: Colors.red,)
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getwidth(context)*0.06,
                          ),
                          Container(
                            width: getwidth(context)*0.42,
                            margin: EdgeInsets.only(top:getheight(context)*0.39,right: getwidth(context)*0.05),
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Field is missing';
                                }
                              },

                              keyboardType: TextInputType.name,
                              controller: lastnameController,
                              decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                    color: Colors.red,
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

                                  ),
                                  prefixIcon: Icon(Icons.person,
                                    color: Colors.red,)
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Field is missing';
                            }
                          },

                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.red,
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

                              ),
                              prefixIcon: Icon(Icons.email,
                                color: Colors.red,)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Field is missing';
                            }
                          },
                          obscureText: passToggle,
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.red,
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

                            ),
                            prefixIcon: Icon(Icons.lock,
                              color: Colors.red,),
                            suffixIcon: InkWell(
                              onTap: (){

                                setState(() {
                                  passToggle= !passToggle;

                                });
                              },
                              child: Icon(
                                passToggle ? Icons.visibility :Icons.visibility_off,
                                color: Colors.red,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: (){
                          if(_formfield.currentState!.validate()){
                            setState(() {
                              loading=true;
                            });
                                            _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString()).then((value){





                                              UserRecords().Useremail=value.user!.email.toString();
                                              UserRecords().Userid=value.user!.uid.toString();

                                               ref.child(value.user!.uid.toString()).set({
                                              'id ': value.user!.uid.toString(),
                                             'First Name' : firstnameController.text.toString(),
                                                'Last Name' : lastnameController.text.toString(),
                                                'height' : "0",
                                                'weight' : "0",

                                              'Email' : value.user!.email.toString(),
                                              }).then((value) {
                                                loading=false;

                                              }).onError((error, stackTrace){
                                                loading=false;
                                                toast(error.toString());
                                              });
                                              setState(() {
                                                Fluttertoast.showToast(
                                                  msg: 'Registered Successfully',
                                                  fontSize: 15.0,
                                                  textColor: Colors.white,
                                                  gravity: ToastGravity.BOTTOM,
                                                );
                                                emailController.clear();
                                                passController.clear();
                                                firstnameController.clear();
                                                lastnameController.clear();

                                                loading=false;
                                              });
                                            }).onError((error, stackTrace){
                                              debugPrint(error.toString());
                                              setState(() {
                                                loading=false;
                                              });
                                              toast(error.toString());
                                            });
                          }
                          Timer(
                              Duration(seconds: 2),
                                  ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> loginpage(usernameController: ''))
                              ));

                        },
                        child: Container
                          (
                          height: 50,
                          width: getwidth(context)*0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: loading? CircularProgressIndicator(
                              color: Colors.white,
                            ) :Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  SizedBox(
                                height: 10,
                              ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Already have an account ?",
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                          ),
                          Container(
                            width: 45,
                            child: TextButton(
                              child: Text(

                                'Login',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>loginpage(usernameController: '')));
                              },
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
    );
  }
}


class User{
  late String id;
  late String email;
  late String first_name;
  late String last_name;
    User({
    this.id='',
      required this.first_name,
      required this.last_name,
      required this.email,
});
    Map<String,dynamic> toJson()=> {
      'id' : id,
      'First Name': first_name,
        'Last Name': last_name,
      'Email': email,
    };

}