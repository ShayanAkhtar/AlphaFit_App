import 'package:alphafitness/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'UserRecordManager.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  final _formfield=GlobalKey<FormState>();
  final forgotpassController=TextEditingController();
  bool loading =false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    Text('FORGOT',style: TextStyle(color: Colors.red,fontSize: 30,letterSpacing: 1,fontFamily: "BebasNeue"),),
    SizedBox(
    width: 8,
    ),
    Text('PASSWORD',style: TextStyle(color: Colors.white70,fontSize: 30,letterSpacing: 1,fontFamily: "BebasNeue"),)
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Container(
    margin: EdgeInsets.only(top:getheight(context)*0.05,left: getwidth(context)*0.05,right: getwidth(context)*0.05),
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
    controller: forgotpassController,
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
      SizedBox(height: 20,),
      InkWell(
        onTap: (){
          if(_formfield.currentState!.validate()){
            setState(() {
              loading=true;
            });
            _auth.sendPasswordResetEmail(email: forgotpassController.text.toString()).then((value){
              setState(() {
                Fluttertoast.showToast(
                  msg: 'Email sent ',
                  fontSize: 15.0,
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                );
                forgotpassController.clear();
                loading=false;
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>loginpage(usernameController: '')), (route) => false);
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
              'Reset',
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
    ]))))
    );
  }
}
