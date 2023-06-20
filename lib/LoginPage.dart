import 'package:alphafitness/ForgotPassword.dart';
import 'package:alphafitness/HomeScreen.dart';
import 'package:alphafitness/LoginWithPhone.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'set_height_and_width.dart';
import 'SignUp.dart';
class loginpage extends StatefulWidget {
  final String usernameController;
  const loginpage({Key? key,required this.usernameController}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  var Username;
  final _formfield=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  bool passToggle=true;
  bool loading =false;
  final _auth=FirebaseAuth.instance;
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              Container(
                margin: EdgeInsets.only(top:getheight(context)*0.39,left: getwidth(context)*0.05,right: getwidth(context)*0.05),
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
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>forgot_password()));
                    }, child:
                    Text('Forgot Password ? ',style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
         SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if(_formfield.currentState!.validate()){
                    setState(() {
                      loading=true;
                    });
                   _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString()).then((value){
                     UserRecords().Useremail=value.user!.email.toString();
                     UserRecords().Userid=value.user!.uid.toString();
                      setState(() {
                        Fluttertoast.showToast(
                          msg: 'login Successfully',
                          fontSize: 15.0,
                          textColor: Colors.white,
                          gravity: ToastGravity.BOTTOM,
                        );
                        emailController.clear();
                        passController.clear();
                        loading=false;
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homescreen()), (route) => false);
                      });
                   }).onError((error, stackTrace){
                     setState(() {
                       loading=false;
                     });
                     toast(error.toString());
                   });
                  }

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
                    child: loading ? CircularProgressIndicator(
                      color: Colors.white,
                    ) :Text(
                      'Login',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                  Container(
                    width: 55,
                    child: TextButton(
                      child: Text(

                        'Signup',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>signup()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
      ));
  }
}
