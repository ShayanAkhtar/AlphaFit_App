import 'package:alphafitness/VerifyCode.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'set_height_and_width.dart';
class login_with_phone extends StatefulWidget {
  const login_with_phone({Key? key}) : super(key: key);

  @override
  State<login_with_phone> createState() => _login_with_phoneState();
}

class _login_with_phoneState extends State<login_with_phone> {
  bool loading=false;
  final auth=FirebaseAuth.instance;
  final _formfield=GlobalKey<FormState>();
  final usernameController=TextEditingController();
  final phoneController=TextEditingController();
  DatabaseReference ref=FirebaseDatabase.instance.ref().child('Phone_Users');
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
        child: Container(
          margin: EdgeInsets.only(top: getheight(context)*0.45),
          child: SingleChildScrollView(
    child: Form(

    key :_formfield,
    child:
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

                  keyboardType: TextInputType.name,
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: "Name",
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
              Container(

                margin: EdgeInsets.only(top: 20,left: getwidth(context)*0.05,right: getwidth(context)*0.05),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Field is missing';
                    }
                  },

                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                      labelText: "Phone",
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
                      prefixIcon: Icon(Icons.phone,
                        color: Colors.red,)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formfield.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    auth.verifyPhoneNumber(
                        phoneNumber: phoneController.text,
                        verificationCompleted: (_) {
                          setState(() {
                            ref.child(DateTime.now().microsecondsSinceEpoch.toString()).set({
                              'Name' : usernameController.text.toString(),
                            }).then((value) {
                              loading=false;

                            }).onError((error, stackTrace){
                              loading=false;
                              toast(error.toString());
                            });
                            loading = false;
                          });
                        },
                        verificationFailed: (e) {
                          setState(() {
                            loading = false;
                          });
                          toast(e.toString());
                        },
                        codeSent: (String verificationId, int? token) {
                          setState(() {
                            loading = false;
                          });
                          // after this move to verification screen.....
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>
                              verify_with_code(
                                verificationId: verificationId,)));
                        },
                        codeAutoRetrievalTimeout: (e) {
                          toast(e.toString());
                        }
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>login_with_phone()));
                  }
                }
                ,
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
    ) :
                     Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ),
      ),
        ),
      ));
  }
}
